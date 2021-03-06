import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/Dashboard.dart';
import 'package:second_app/LoginScreen.dart';
import 'package:second_app/splash.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {

  static const KEY = 'phone';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primaryColor: Colors.cyan, //for different clr of purple
      ),
      // home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) =>SplashScreen(),
        LoginScreen.SCREEN_NAME: (context) => LoginScreen(),
        Dashboard.SCREEN_NAME: (context) => Dashboard()},
    );
  }
}
