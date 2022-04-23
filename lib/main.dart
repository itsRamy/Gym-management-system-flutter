import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
