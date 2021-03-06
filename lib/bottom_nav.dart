import 'package:flutter/material.dart';

import 'home.dart';
import 'music.dart';
import 'settings.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: display(_selected),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        elevation: 5.6,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selected,
        onTap: (int i){
          setState(() {
            _selected = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Like",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Save'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile')
        ],
      ),
    );
  }

  display(int selected) {
    switch (selected) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return MusicScreen(data: "Bottom Nav");
        break;
      case 2:
        return SettingsScreen();
        break;
    }
  }
}
