import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Container(
          width: _deviceSize.width / 2,
          height: _deviceSize.height,
          color: Theme.of(context).primaryColorDark,
        ),
        Container(
          width: _deviceSize.width / 2,
          height: _deviceSize.height,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}