import 'package:first_app/screens/calendar_test.dart';
import 'package:first_app/screens/details_page.dart';
import 'package:first_app/screens/testListView.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'details_page.dart';
import 'login_page.dart';
import 'reservation_page.dart';
import 'package:first_app/screens/profile_page.dart';

import 'package:first_app/screens/login_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController pageController = PageController();
  List<Widget> pages = [
    Home(),
    MyApp(),
    Test(),
    ProfileUI2(),
  ];

  int selectIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.grey[700],
        selectedItemColor: Colors.limeAccent[700],
        unselectedItemColor: Colors.white,
        //iconSize:20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectIndex == 0 ? Colors.green : Colors.grey,
              ),
                label: 
                "calendar"
              
            ),
          BottomNavigationBarItem(
              icon: /* InkWell(
                onTap: () {
                  showMyDialog();
                }, 
                child:*/ Icon(
                  Icons.calendar_today_rounded,
                  color:
                      selectIndex == 1 ? Colors.limeAccent[700] : Colors.white,
                ),
                  label: 
                "Profile"
              
              
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: selectIndex == 2 ? Colors.limeAccent[700] : Colors.white,
              ),
                label: 
                "Profilee"
              
          ),

          /*  BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ), */
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: selectIndex == 3 ? Colors.limeAccent[700] : Colors.white,
              ),
              label: 
                "Profile"
              ),
        ],
      ),
    );
   
  }
   Future<void> showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
}
