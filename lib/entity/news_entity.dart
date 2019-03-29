import 'package:flutter/material.dart';

class NewsEntity {
  final String imgURL;
  String title;
  String description;
  String shortDesc;

  NewsEntity({@required this.imgURL,@required this.title,@required this.description, @required this.shortDesc});
}