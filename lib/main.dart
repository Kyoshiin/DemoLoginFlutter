import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/LoginScreen.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primaryColor: Colors.cyan, //for different clr of purple
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
