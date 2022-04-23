import 'dart:convert';
import 'dart:io';

import 'package:first_app/classes/user.dart';
import 'package:first_app/screens/edit_profile_page.dart';
import 'package:first_app/screens/profile_page.dart';
import 'package:first_app/widget/TextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_app/widget/EditImageBottom.dart';
import 'forgot_pwd.dart';

class Edite extends StatefulWidget {
  @override
  State<Edite> createState() => _Edite();
}

final ImagePicker _picker = ImagePicker();
late PickedFile imageFile;
int id = 0;
User userForm = User();
String token = "";

getTokenFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  id = prefs.getInt('id')!;
  token = prefs.getString('token')!;
}

class _Edite extends State<Edite> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            child: FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              userForm.email = snapshot.data[0].username;
              userForm.email = snapshot.data[0].email;
              userForm.lastName = snapshot.data[0].lastName;
              userForm.firstName = snapshot.data[0].firstName;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Container(
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
                          Positioned(
                              bottom: 0,
                              right: -25,
                              child: RawMaterialButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                elevation: 2.0,
                                fillColor: Color(0xFFF5F6F9),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.limeAccent[700],
                                ),
                                padding: EdgeInsets.all(10.0),
                                shape: CircleBorder(),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
                  Container(
                    child: Text(
                      'Username : ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.limeAccent[700],
                        //    fontFamily: 'robo',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      initialValue: snapshot.data[0].username,
                      onChanged: (value) {
                        userForm.username = value;
                      },
                    ),
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
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      initialValue: snapshot.data[0].lastName,
                      onChanged: (value) {
                        userForm.lastName = value;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      'Prenom : ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.limeAccent[700],
                        //    fontFamily: 'robo',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      onChanged: (value) {
                        userForm.firstName = value;
                      },
                      initialValue: snapshot.data[0].firstName,
                    ),
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
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      onChanged: (value) {
                        userForm.email = value;
                      },
                      initialValue: snapshot.data[0].email,
                    ),
                  ),
                  //SizedBox(height: 5),
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
                        update();
                        /*    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp())); 
                  */
                        showToast();
                      },
                      child: Text(
                        'Enregistrer',
                        style: TextStyle(
                          fontFamily: 'robo',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 5),
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
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
         /*  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ], */
        ],      
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile!;
    });
  }

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    getTokenFromSF();
    getUserData();
    fToast = FToast();
    fToast.init(context);
  }

  void update() async {
    var data = {
      "email": userForm.email,
      "first_name": userForm.firstName,
      "last_name": userForm.lastName,
      "username": userForm.username
    };
    print("*********${jsonEncode(data)}");

    Response response = await put(
        Uri.parse('https://gym-server.zetabox.tn/api/users/${id}'),
        headers: {'Authorization': 'Bearer $token'},
        body: data);

    if (response.statusCode == 200) {
      print('successfuly updated');
      Navigator.pop(context);
    } else {
      print("ffff");
    }
  }

  showToast() {
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
          Text("Profil mise a jour avec succée!"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
