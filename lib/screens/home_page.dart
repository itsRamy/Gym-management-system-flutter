

import 'package:first_app/screens/NavigationBar.dart';
import 'package:first_app/screens/calendar_test.dart';
import 'package:first_app/screens/details_page.dart';
import 'package:first_app/screens/reservation_page.dart';
import 'package:first_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  bool _loading = false;
  double rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'My reservations',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.limeAccent[700],
                    //    fontFamily: 'robo',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              SizedBox(height: 15),
              Container(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,

                          child: IconButton(
                            icon: Icon(Icons.more_vert,
                                color: Colors.limeAccent[900]),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details()));
                            },
                          ),
                          //  ),
                        ),
                        const ListTile(
                          leading: Image(
                            image: AssetImage('assets/BackgroundImage.jpg'),
                            height: 100,
                            width: 100,
                          ),
                          title: Text('Cardio',
                              style: TextStyle(
                                letterSpacing: 1.2,
                              )),
                          subtitle: Text('GYM',
                              style: TextStyle(
                                letterSpacing: 1.2,
                              )),
                        ),
                        //   Container(
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Text(
                  'Solde disponibles',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.limeAccent[700],
                    //    fontFamily: 'robo',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              //  SizedBox(height: 5),
              Container(
                child: Card(
                  color: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Forfait d'entrainement (10 séances)",
                            style: TextStyle(
                              fontFamily: 'robo',
                              fontSize: 20,
                              color: Colors.green[400],
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Utilisation',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                    // fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(width: 38),
                              Text("Date d'expiration",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                    // fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('3/10',
                                  style: TextStyle(
                                    color: Colors.green[400],
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(width: 85),
                              Text("17-12-2022",
                                  style: TextStyle(
                                    color: Colors.green[400],
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: Colors.limeAccent[700],
                          inactiveColor: Colors.lightGreen[300],
                          value: rating,
                          max: 10,
                          divisions: 10,
                          label: rating.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              rating = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.limeAccent[700],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),

                // alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text(
                    'Réserver',
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
      ),
    );
  }
}
