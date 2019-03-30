import 'package:flutter/material.dart';


class newListTile extends StatelessWidget {
  final icon;
  final  title;
  final subtitle;


  newListTile({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          icon,
          SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              title,
              subtitle
            ],
          ),

        ],
      ),
    );
  }
}
