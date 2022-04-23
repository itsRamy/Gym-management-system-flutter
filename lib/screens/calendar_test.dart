import 'dart:math';

import 'dart:convert';
import 'package:calendar_view/calendar_view.dart';
import 'package:dio/dio.dart';
import 'package:first_app/widget/appbar_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:floating_text/floating_text.dart';
import 'testListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<NeatCleanCalendarEvent> items = [];
  late String coach;
  late String activ;
  late DateTime startt;
  late DateTime endt;
  late DateTime fulldatee;

  Future<List<NeatCleanCalendarEvent>> getsch() async {
    List<NeatCleanCalendarEvent> schedules = [];

    var response = await http.get(
        Uri.parse('https://gym-server.zetabox.tn/api/schedules?populate=*'));
    var jsonData = jsonDecode(response.body)['data'];
    print(response.body);
    for (int i = 0; i < jsonData.length; i++) {
      DateTime fulldate = DateTime.parse(jsonData[i]['attributes']['FullDate']);
      int st = int.parse(jsonData[i]['attributes']['start_time']
          .toString()
          .split('T')[1]
          .split(':')[0]);

      int et = int.parse(jsonData[i]['attributes']['end_time']
          .toString()
          .split('T')[1]
          .split(':')[0]);

      schedules.add(NeatCleanCalendarEvent(
        jsonData[i]['attributes']['activity']['data']['attributes']['name']
            .toString(),
        startTime: DateTime(fulldate.year, fulldate.month, fulldate.day, st),
        endTime: DateTime(fulldate.year, fulldate.month, fulldate.day, et),
        description:
            'Coache : ${jsonData[i]['attributes']['coaches']['data'][0]['attributes']['username'].toString()}',
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        activity: jsonData[i]['attributes']['activity']['data']['attributes']
                ['name']
            .toString(),
      ));
    }
    return schedules;
  }

  bool loading = false;
  fetchSchedule() async {
    var schedd = await getsch();
    setState(() {
      items.addAll(schedd);
      loading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => fetchSchedule());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: (loading == false)
            ? CircularProgressIndicator()
            : Card(
                child: Calendar(
                  startOnMonday: true,
                  weekDays: ['Lu', 'Ma', 'Me', 'Ju', 'Ve', 'Sa', 'Di'],

                  eventsList: (loading == false) ? items : items,
                  onEventSelected: (value) {
                    coach = value.description;
                    startt = value.startTime;
                    endt = value.endTime;
                    activ = value.activity;
   
                  },

                  isExpandable: true,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.limeAccent[700],
                  todayColor: Colors.green[400],

                  eventColor: Colors.green[400],
                  locale: 'fr_FR',
                  todayButtonText: 'Aujourd\'hui',
                  allDayEventText: 'Ganztägig',
                  multiDayEndText: 'Ende',
                  isExpanded: true,
                  expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                  // datePickerType: DatePickerType.date,
                  dayOfWeekStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Reserve();

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Test()));
        },
        label: const Text(
          'Reservez',
          style: TextStyle(
            fontFamily: 'robo',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        focusColor: Colors.limeAccent[700],
        backgroundColor: Colors.limeAccent[700],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //SizedBox(height: 10),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }

  //---------------------------------Reserver---------------------------//
  void Reserve() async {
    var response = await Dio()
        .post('https://gym-server.zetabox.tn/api/reservations', data: {
      "data": {
        "Coach": coach,
        "start_time": startt.toString(),
        "end_time": endt.toString(),
        "activity": activ,
      }
    });
    print("hellooooooooooooooooo*$response");
    if (response.statusCode == 200) {
    } else {
      print("byebye");
    }
  }
}
