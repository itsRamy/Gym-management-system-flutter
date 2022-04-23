import 'package:first_app/classes/user.dart';
import 'package:first_app/screens/edit_profile_page.dart';
import 'package:first_app/screens/forgot_pwd.dart';
import 'package:first_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'NavigationBar.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var useForm = User();
  bool _loading = false;
  late String token;
  late int id;
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Image(
                  image: AssetImage('assets/BackgroundImage.jpg'),
                  height: 200,
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Image(
                  image: AssetImage('assets/logo.jpg'),
                  height: 50,
                  width: 50,
                ),
              ),

              Container(
                  height: 30,
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
                height: 50,
                child: Center(
                  child: Text(
                    'LOGIN',
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
              Form(
                key:_formkey,
                child:
              Container(
                height: 65,
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
                child: TextFormField(
                  onChanged: (val) {
                    userForm.email = val;
                    
                  },
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Nom d\'utilisateur ne doit pas etre vide !';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.limeAccent[700]),
                      labelText: "Email or phone",
                      iconColor: Colors.green),
                ),
              ),),
              Form(
                key:_formkey2,
                child:
              Container(
                height: 65,
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
                child: TextFormField(
                  onChanged: (val) {
                    userForm.password = val;
                  },
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Mot de passe ne doit pas etre vide !';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,

                      //Icons.arrow_forward_ios ,
                      color: Colors.limeAccent[700],
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),),
              Container(
                height: 70,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
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
                    if (_formkey.currentState!.validate() && _formkey2.currentState!.validate() ){
                      signin();
                    }
                    
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'robo',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forgot()));
                  },
                  child: Text(
                    'Forgot password ? click here.',
                    style: TextStyle(
                      fontFamily: 'robo',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      height: 30,
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.white,
                        height: 36,
                        thickness: 1,
                        indent: 10,
                      )),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontFamily: 'robo',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: new Container(
                      height: 30,
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.white,
                        height: 36,
                        endIndent: 10,
                        thickness: 1,
                      )),
                ),
              ]),
              SizedBox(height: 15),
              Container(
                height: 70,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
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
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    'Create an account',
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

  //--------------------------------------Sign in ---------------------------------------------------

  void signin() async {
    print(userForm.email);
    print(userForm.password);
    setState(() => _loading = true);
    var data = {
      "identifier": "${userForm.email}",
      "password": "${userForm.password}",
    };
    Response response = await post(
        Uri.parse('https://gym-server.zetabox.tn/api/auth/local'),
        body: data);
    print(response.statusCode);

    final responseDate = jsonDecode(response.body);

    print("${response.statusCode}");
    if (response.statusCode == 200) {
      token = responseDate['jwt'];
      id = responseDate['user']['id'];
      setState(() => _loading = false);

      addTokenToSF();

      print('successfuly connected');
      showToast1();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    } else {
      showToast2();
      print("faild");
    }
  }

  addTokenToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('id', id);
  }

  late FToast fToast;
  late FToast fToast1;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast1 = FToast();
    fToast.init(context);
    fToast1.init(context);
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
          Text("Connecté avec succée!"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  showToast2() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Oups! Verifiez vos données!"),
        ],
      ),
    );

    fToast1.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
