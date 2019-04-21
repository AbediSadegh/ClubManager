import 'package:flutter/material.dart';

class NewListTile extends StatelessWidget {
  final icon;
  final title;
  final subtitle;

  NewListTile({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          icon,
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[title, subtitle],
          ),
        ],
      ),
    );
  }
}
