import 'package:flutter/material.dart';

// use the info bulb to change to stless -> stful

class MusicScreen extends StatelessWidget {
  String data;
  MusicScreen({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>print("Play music"),
      tooltip: "I'm Fav!",
      child: Icon(Icons.play_arrow),
      backgroundColor: Colors.cyan,),
      
      body: Center(
        child: Container(
          child: Text("Music $data"),
        ),
      ),
    );
  }
  
}



