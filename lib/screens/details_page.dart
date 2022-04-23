import 'package:first_app/classes/reservation.dart';
import 'package:first_app/screens/NavigationBar.dart';
import 'package:first_app/screens/calendar_test.dart';
import 'package:first_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'reservation_page.dart';
import 'package:first_app/widget/appbar_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Card> items = [];
  late String coach;
  late String activ;
  late DateTime startt;
  late DateTime endt;

  late List<Res> reservations;

  Future getReservations() async {
    List<Card> reservations = [];
    var response = await http
        .get(Uri.parse('https://gym-server.zetabox.tn/api/reservations'));
    var jsonData = jsonDecode(response.body)['data'];
    print(response.body);
    for (int i = 0; i < jsonData.length; i++) {
     
      int st = int.parse(jsonData[i]['attributes']['start_time']
          .toString()
          .split('T')[1]
          .split(':')[0]);

      int et = int.parse(jsonData[i]['attributes']['end_time']
          .toString()
          .split('T')[1]
          .split(':')[0]);
      reservations.add(
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Text('Seance de : ${jsonData[i]['attributes']['activity'].toString()}',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text('Date : ${st.toString()}',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text('Heure : ',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text('Durée : ',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(jsonData[i]['attributes']['Coach']
              .toString(),
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/BackgroundImage.jpg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text('Specialty : ',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text('Phone : ',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text('Mail : ',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.lightGreen[700],
                      )),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }
    return reservations;
  }
    bool loading = false;
  fetchReservation() async {
    var res = await getReservations();
    setState(() {
      items.addAll(res);

      loading = true;
    });
  }
   @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.

    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => fetchReservation());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.black,
      body: 
      SafeArea(
        child: (loading == false)
            ? CircularProgressIndicator()
            : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'Les details de votre reservation : ',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.limeAccent[700],
                    //    fontFamily: 'robo',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
            
             Expanded(
                 child :
              Container(
                child: ListView(
                padding: const EdgeInsets.all(8),
                children: (loading == false) ? items : items,
              ),
              ),
               ),
            
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.limeAccent[700],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),

                // alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text(
                    'Modifier',
                    style: TextStyle(
                      fontFamily: 'robo',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),

                // alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'robo',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  
  }
}
