import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  final String title;
  const CoustomText(this.title, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(null == title ? '':title);
  }
}
