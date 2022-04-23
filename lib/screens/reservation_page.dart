import 'package:first_app/screens/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:first_app/dates_list.dart';
import 'package:first_app/light_colors.dart';
import 'package:first_app/task_container.dart';

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.topCenter,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 130),
                    Container(
                      child: Center(
                        child: Text(
                          'Avril',
                          style: TextStyle(
                            fontFamily: 'robo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 30),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDateColumn(4, "Sam", false),
                buildDateColumn(5, "Dim", true),
                buildDateColumn(6, "Lun", false),
                buildDateColumn(7, "Mar", false),
                /*                buildDateColumn(11, "T", false),
                buildDateColumn(12, "F", false),
                buildDateColumn(13, "S", false), */
              ],
            ),
          ),
          Expanded(
            // child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: time.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${time[index]} ${time[index] > 8 ? 'AM' : 'PM'}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        TaskContainer(
                          title: 'Musculation',
                          subtitle: 'jack',
                          boxColor: LightColors.kPalePink,
                        ),
                        Divider(
                          color: Colors.limeAccent[700],
                          height: 36,
                          thickness: 2,
                          indent: 10,
                          endIndent: 15,
                        ),
                        TaskContainer(
                          title: 'Cardio',
                          subtitle: 'Leo',
                          boxColor: LightColors.kLightGreen,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(135, 20, 135, 20),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
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
        ]),
      ),
    );
  }

  Container buildDateColumn(int date, String weekDay, bool isActive) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: isActive ? Colors.limeAccent[700] : Colors.lime[100],
          borderRadius: BorderRadius.circular(43)),
      height: 120,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date.toString(),
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 36),
          ),
          Text(
            weekDay,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
