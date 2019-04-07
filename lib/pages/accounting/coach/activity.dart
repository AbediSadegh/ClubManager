import 'package:flutter/material.dart';

class Activity {
  String title;
  String cost;
  bool isPay = false;
  Text text ;
  //String details;
  //String transaction;

  Activity({
    this.title="",
    this.cost,
    this.isPay = false,
    this.text=  const Text(""),
    //  this.details,
    //this.transaction
  });
}
