import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'NavigationBar.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:email_auth/email_auth.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  get emailcontroller => emailcontroller;
  final userOTP = TextEditingController();
  bool verif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Image(
                  image: AssetImage('assets/BackgroundImage.jpg'),
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                  child: Center(
                child: Text(
                  'Bienvenue sur SportApp',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                    fontFamily: 'robo',
                    letterSpacing: 1.2,
                  ),
                ),
              )),
              // SizedBox(height: 10),
              Container(
                child: Center(
                  child: Text(
                    'VERIFICATION',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      //    fontFamily: 'robo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                decoration: BoxDecoration(
                  color: Colors.lime[50],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: userOTP,
                  decoration: InputDecoration(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                decoration: BoxDecoration(
                  color: Colors.limeAccent[700],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),

                // alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Verify()));
                  },
                  child: Text(
                    'Vérifier',
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

  //---------------------------Verify----------------------------------
 /*  bool verifyOTP() {
    EmailAuth e = EmailAuth(sessionName: "Verification du compte");

    var res = e.validateOtp(
        recipientMail: emailcontroller.text, userOtp: userOTP.text);
    if (res) {
      verif = true;
      print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH verifier xd");
    } else {
      verif = false;
      print("failure");
    }
    return verif;
  } */
}
