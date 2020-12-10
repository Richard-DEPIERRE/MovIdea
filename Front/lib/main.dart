import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ThinkWatch/Screens/Welcome/welcome_screen.dart';
import 'package:ThinkWatch/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Think&Watch',
      theme: ThemeData(
        fontFamily: 'SF',
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
