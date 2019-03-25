import 'package:flutter/material.dart';

class CVEntity {
  final String imgURL;
  final String name;
  final String license;
  final String education;
  final String description;

  CVEntity(
      {@required this.imgURL,
      @required this.name,
      @required this.license,
      this.education,
      @required this.description});
}
