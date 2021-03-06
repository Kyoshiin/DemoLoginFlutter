import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_app/Dashboard.dart';
import 'package:second_app/LoginScreen.dart';
import 'package:second_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startCount();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.network("https://www.charislms.com/images/slogin.png",
                width: double.maxFinite, height: double.maxFinite)));
  }

  void startCount() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 5),(){
      var data = sp.getString(FirstApp.KEY) ?? "";

      if(data.isEmpty)
        Navigator.pushReplacementNamed(context, LoginScreen.SCREEN_NAME);
      else
        Navigator.pushReplacementNamed(context, Dashboard.SCREEN_NAME);

    });
  }
}

