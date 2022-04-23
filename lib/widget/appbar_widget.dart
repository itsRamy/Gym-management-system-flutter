import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading:  CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/kiki.jpg'),
          ),
    backgroundColor: Colors.black,
    elevation: 1,
    actions: [
  
  InkWell(
  onTap: () => print("image clicked"),
  child:
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/BackgroundImage.jpg'),
              
            ),
  ),
            
    ]
  );
}
