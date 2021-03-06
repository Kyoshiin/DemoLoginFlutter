import 'package:flutter/material.dart';

// use the info bulb to change to stless -> stful
class HomeScreen extends StatelessWidget {

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
    return ListView(
      scrollDirection: Axis.horizontal, // for align horizontally
      children: [

        Container(
          width: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(myList[0]['image']),
              ),
              title: Text(myList[0]['name']),
              subtitle: Text(myList[0]['desc']),
              trailing: Icon(Icons.favorite),
            ),
          ),
        ),

        Container(
          width: 200,
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(myList[1]['image']),
              ),
              title: Text(myList[1]['name']),
              subtitle: Text(myList[1]['desc']),
              trailing: Icon(Icons.favorite),
            ),
          ),
        ),

        Container(
          width: 200,
          child: ListTile(
            leading: CircleAvatar(
              child: Image.network(myList[2]['image']),
            ),
            title: Text(myList[2]['name']),
            subtitle: Text(myList[2]['desc']),
            trailing: Icon(Icons.favorite),
          ),
        ),

        Container(
          width: 200,
          child: ListTile(
            leading: CircleAvatar(
              child: Image.network(myList[3]['image']),
            ),
            title: Text(myList[3]['name']),
            subtitle: Text(myList[3]['desc']),
            trailing: Icon(Icons.favorite),
          ),
        ),
      ],
    );
  }
}



