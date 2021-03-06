import 'dart:io'; // not html

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:second_app/LoginScreen.dart';
import 'package:second_app/bottom_nav.dart';
import 'package:second_app/home.dart';
import 'package:second_app/main.dart';
import 'package:second_app/music.dart';
import 'package:second_app/musicPlayer.dart';
import 'package:second_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static const SCREEN_NAME = '@route-dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SharedPreferences sp;
  int _selected = 0;
  String user;
  File url;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    define();
    // _selected = 1; <-- gets initialised everytime on setchanged
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person_remove),
            ),
            onTap: () => logout(context),
          )
        ],
      ),
      body: display(_selected),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: url == null
                        ? AssetImage('images/ic_launcher.png')
                        : FileImage(url),
                    radius: 50,
                    backgroundColor: Colors.cyan[100],
                    // child: url == null
                    //     ? Icon(Icons.person, size: 40)
                    //     : Image.file(url,
                    //     fit: BoxFit.fill,
                    //   width: 60,
                    //   height: 60,
                    // ),
                  ),
                  onTap: () => openModal() //changeImage(),
                  ),
              accountName: Text("Pratyay"),
              accountEmail: Text(user),
            ),
            // DrawerHeader(
            //   child: Text("Hi $user"),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                setState(() {
                  _selected = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text("Music"),
              onTap: () {
                setState(() {
                  _selected = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                setState(() {
                  _selected = 2;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Media PLayer"),
              onTap: () {
                setState(() {
                  _selected = 3;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("BottomNavScreen"),
              onTap: () {
                setState(() {
                  _selected = 4;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  logout(BuildContext context) async {
    sp = await SharedPreferences.getInstance();
    await sp.clear();
    Navigator.popAndPushNamed(context, LoginScreen.SCREEN_NAME);
  }

  void define() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      user = sp.getString(FirstApp.KEY) ?? '';
    });
  }

  display(int selected) {
    switch (selected) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return MusicScreen(data: null);
        break;
      case 2:
        return SettingsScreen();
        break;

      case 3:
        return MusicPlayerScreen();
        break;

      case 4:
        return BottomNav();
        break;
    }
  }

  changeImage(ImageSource src) async {
    try {
      final _pickedFile = await picker.getImage(source: src);
      if (_pickedFile == null) return;

      if (src == ImageSource.camera) {
        // if camera then store
        //location provided by path provider
        final _extDir = await getExternalStorageDirectory();
        final imgPath = '${_extDir.path}/all_images'; // path location
        final imgDir = await new Directory(imgPath).create();
        File tmp = File(_pickedFile.path); // temp file from image
        print(imgDir.path); // for debug

        if (imgDir.isAbsolute) {
          tmp = await tmp.copy("$imgPath/IMG_${DateTime.now()}.jpg");
        }
      }
      setState(() {
        url = File(_pickedFile.path);
      });
    } catch (e) {
      print(e);
    }
  }

  /// Bottom modal for options
  openModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.cyan,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: () {
                    changeImage(ImageSource.camera);
                    Navigator.pop(context); // for dismissing the bottomsheet
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.folder),
                    onPressed: () {
                      changeImage(ImageSource.gallery);
                      Navigator.pop(context); // for dismissing the bottomsheet
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
