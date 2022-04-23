import 'package:first_app/screens/login_page.dart';
import 'package:first_app/screens/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';
import 'NavigationBar.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:email_auth/email_auth.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailcontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();
  final nomcontroller = TextEditingController();
  final prenomcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confpasscontroller = TextEditingController();
  bool _loading = false;
  final _formkey = GlobalKey<FormState>();

  //get verifyOTP => verifyOTP;

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
                    "S'INSCRIRE",
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
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.limeAccent[700]),
                      labelText: "Saisir votre username",
                      iconColor: Colors.green),
                ),
              ),

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
                  controller: prenomcontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.limeAccent[700]),
                      labelText: "Saisir votre prenom",
                      iconColor: Colors.green),
                ),
              ),
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
                  controller: nomcontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.limeAccent[700]),
                      labelText: "Saisir votre nom",
                      iconColor: Colors.green),
                ),
              ),
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
                      icon: Icon(Icons.email, color: Colors.limeAccent[700]),
                      labelText: "Email",
                      iconColor: Colors.green),
                ),
              ),

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
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,

                      //Icons.arrow_forward_ios ,
                      color: Colors.limeAccent[700],
                    ),
                    labelText: 'Mot de pass',
                  ),
                ),
              ),
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
                  obscureText: true,
                  controller: confpasscontroller,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,

                      //Icons.arrow_forward_ios ,
                      color: Colors.limeAccent[700],
                    ),
                    labelText: 'Confirm password',
                  ),
                ),
              ),
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
                    signup();
                             Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));

                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'robo',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //  SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
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
      ),
    );
  }

  //---------------------------------Register---------------------------//
  void signup() async {
    setState(() => _loading = true);
    Response response = await http.post(
        Uri.parse('https://gym-server.zetabox.tn/api/auth/local/register'),
        body: {
          "username": fullnamecontroller.text,
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
          "first_name": prenomcontroller.text,
          "last_name": nomcontroller.text,
        });
    final responseDate = jsonDecode(response.body);
    final token = responseDate['jwt'];
    if (response.statusCode == 200) {
      setState(() => _loading = false);
      showToast1();
      print("REGIIIIIIIIIIIIIIIIIIISTREEEEEEEEEEEEEEEEEEEEEEEEEEE${token}");
    } else {
      setState(() => _loading = false);
    }
  }

  //----------------------------------Verify-----------------------------------//
 /*  void sendOTP() async {
    EmailAuth e = EmailAuth(sessionName: "Code verification");

    var res = await e.sendOtp(recipientMail: emailcontroller.text);

    if (res) {
      print("OTP sent");
    } else {
      print("failure");
    }
  } */

  //----------------------------------test----------------------------------------
  void verif2() async {
    setState(() => _loading = true);
    Response response = await http.post(
        Uri.parse(
            'https://gym-server.zetabox.tn/api/auth/send-email-confirmation'),
        body: {"email": emailcontroller.text});
    final responseDate = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      setState(() => _loading = false);
      print("User created ");
    } else {
      print("User not created ");
    }
  }

  late FToast fToast;
  late FToast fToast1;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast1 = FToast();
    fToast.init(context);
  }

  showToast1() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.limeAccent[700],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("User created!"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }
}
