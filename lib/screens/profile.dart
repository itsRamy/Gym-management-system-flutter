/* import 'dart:io';

import 'package:first_app/classes/user.dart';
import 'package:first_app/screens/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:developer' as dev;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  String token = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
    
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/kiki.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuZ9k0a58JfVhJt69eL2ajiaasscYV6L5P2Yu9OMo_YrG3J-OIPw1H4TI6lXRP-6U6vLA&usqp=CAU'),
      );

  Widget buildContent() => Container(
          child: FutureBuilder(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading",style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
              ),
            );
          } else {
            return Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  snapshot.data.username,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),

                /*  Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const  */
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  title: Text('Nom',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('GYM',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 20,
                      )),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  title: Text('Prénom',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('GYM',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 20,
                      )),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 40,
                    color: Colors.white,
                  ),
                  title: Text('Email',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('GYM',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 20,
                      )),
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
                     
                      getTokenFromSF();
                      print(token);

                      getUserData();
                    },
                    child: Text(
                      'Editer votre profile',
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
          }
        },
        
      )
      
      );

  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
  }

  Future getUserData() async {
    Response response = await get(
      Uri.parse('https://gym-server.zetabox.tn/api/users/me'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    var jsonData = jsonDecode(response.body);
    print(jsonData['username']);
    User user = User.fromJson(jsonData);
    return print(user);
  }

    @override
  void initState() {
    super.initState();
    getTokenFromSF();

  }

}
 */