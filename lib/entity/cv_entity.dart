import 'package:flutter/material.dart';

class CVEntity {
  final String imgURL;
  String name;
  String license;
  String education;
  String description;

  CVEntity(
      {@required this.imgURL,
      @required this.name,
      @required this.license,
      this.education,
      @required this.description});
}
