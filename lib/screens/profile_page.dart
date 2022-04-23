import 'dart:convert';
import 'dart:io';

import 'package:first_app/classes/user.dart';
import 'package:first_app/screens/edit_profile_page.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgot_pwd.dart';

class ProfileUI2 extends StatefulWidget {
  @override
  State<ProfileUI2> createState() => _ProfileUI2State();
}

String token = "";
late List userlist;

getTokenFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token')!;
  return print('RETUUUUUUUUUUUUUURNEEEEEEEEEEEEED TOKEEEEN : ${token}');
}

deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<List<dynamic>> getUserData() async {
  await getTokenFromSF();
  userlist = [];
  Response response = await get(
      Uri.parse('https://gym-server.zetabox.tn/api/users/me'),
      headers: {'Authorization': 'Bearer $token'});
  var jsonData = jsonDecode(response.body);
  print(jsonData['username']);
  User user = User.fromJson(jsonData);
  userlist.add(user);
  return userlist;
}

class _ProfileUI2State extends State<ProfileUI2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child : Container(
          child: FutureBuilder<List<dynamic>>(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Container(
                  //height: 200,

                  /*  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Editer()));
                    },
                    child: */

                  width: double.infinity,

                  alignment: Alignment(0.0, 2.5),
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/gym.jpg'),
                        ),
                      
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    snapshot.data[0].username,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                  //  padding: EdgeInsets.fromLTRB(300, 0, 300, 0),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Nom : ',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.limeAccent[700],
                      //    fontFamily: 'robo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                         snapshot.data[0].lastName,
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Prénom : ',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.limeAccent[700],
                      //    fontFamily: 'robo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                        
                             snapshot.data[0].firstName,
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Email : ',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.limeAccent[700],
                      //    fontFamily: 'robo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          snapshot.data[0].email,
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ))),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(5.0),
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
                          MaterialPageRoute(builder: (context) => Edite()));
                    },
                    child: Text(
                      'Editer',
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
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                      deleteToken();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Déconnecter',
                      style: TextStyle(
                        fontFamily: 'robo',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    ),);
  }

  @override
  void initState() {
    super.initState();
    // getTokenFromSF();
    getUserData();
  }
}
