import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/music.dart';

// use the info bulb to change to stless -> stful
class SettingsScreen extends StatelessWidget {

  List myList = [
    {'name':"Android",
      'image':'https://res-3.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/qltkjzdqthkeali25e6q',
      'desc': 'Native Development',
    },

    {'name':"Ios",
      'image':'https://www.cbronline.com/wp-content/uploads/2016/05/iOS.jpg',
      'desc': 'Native Development',
    },

    {'name':"Flutter",
      'image':'https://cdn.icon-icons.com/icons2/2108/PNG/512/flutter_icon_130936.png',
      'desc': 'Hybrid App Development',
    },

    {'name':"Xamarin",
      'image':'https://blog.verslu.is/wp-content/uploads/2015/03/xamarin.png',
      'desc': 'Hybrind App Development',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context,index)=>callWdigets(myList[index],context), // requires function with param (ctx, int) which returns widgt
    );
  }

  Widget callWdigets(myList, ctx) {
    return Card(
      elevation: 8,
      color: Colors.cyanAccent,
      child: ListTile(
        title: Text(myList['name']),
        subtitle: Text(myList['desc']),
        onTap: ()=>Navigator.push(ctx, MaterialPageRoute(
            builder: (_)=>MusicScreen(data:myList['name']))),
      ),
    );
  }
}



