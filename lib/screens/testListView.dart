import 'package:first_app/classes/reservation.dart';
import 'package:first_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'details_page.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _testState();
}

class _testState extends State<Test> {
  double rating = 3;
  List<Card> items = [];
  late String coach;
  late String activ;
  late DateTime startt;
  late DateTime endt;
  String token = "";

  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
  }

  late List<Res> reservations;

  Future getReservations() async {
    List<Card> reservations = [];
    var response = await http.get(
      Uri.parse('https://gym-server.zetabox.tn/api/reservations'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var jsonData = jsonDecode(response.body)['data'];
    // print(response.body);
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
        /* Card(
        child: ListTile(
          title: Text(jsonData[i]['attributes']['activity']
              .toString()),
          subtitle: Text(jsonData[i]['attributes']['Coach']
              .toString()),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Details()));
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/kiki.jpg'),
          ),
        ),
      ) */
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,

                  child: IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.limeAccent[900]),
                    onPressed: () {
                      print(jsonData[i]['id'].toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                  ),
                  //  ),
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/BackgroundImage.jpg'),
                    height: 120,
                    width: 120,
                  ),
                  title: Text(jsonData[i]['attributes']['activity'].toString()),
                  subtitle: Text(jsonData[i]['attributes']['Coach'].toString(),
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 18,
                      )),
                ),
                //   Container(
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
    getTokenFromSF();
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
      body: SafeArea(
        child: (loading == false)
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      'Mes réservations :',
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
                    child: Container(
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: (loading == false) ? items : items,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
/*   addTokenToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('id', id);
  } */
}
