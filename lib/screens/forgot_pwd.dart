import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Forgot extends StatefulWidget {
  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailcontroller = TextEditingController();
  bool _loading = false;

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Image(
                  image: AssetImage('assets/logo.jpg'),
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Center(
                  child: Text(
                    'Retrouvez votre compte',
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
                  child: Center(
                    child: Text(
                      'Veuillez entrer votre adresse e-mail pour rechercher votre compte.',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'robo',
                        letterSpacing: 1.2,
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
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
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.limeAccent[700]),
                      labelText: "Email",
                      iconColor: Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
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
                    sendEmail();
                  },
                  child: Text(
                    'Send Email verification',
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

//--------------------------------------Verification ---------------------------------
  void sendEmail() async {
    setState(() => _loading = true);
    http.Response response = await http.post(
        Uri.parse('https://gym-server.zetabox.tn/api/auth/forgot-password'),
        body: {
          "email": emailcontroller.text,
        });
    final responseDate = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      setState(() => _loading = false);
      print("Email sent successfuly");
    } else {
      setState(() => _loading = false);
      print("Failure");
    }
  }
}
