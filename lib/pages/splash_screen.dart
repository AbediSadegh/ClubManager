import 'dart:async';

import 'package:club_manager/FakeEntity.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/ServerProvider.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  startTime() {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration , navigationPage );
  }

  navigationPage() {
    Navigator.of(context).pushReplacementNamed('/mainPage');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//        backgroundColor: new Color(0xff075E54),
    backgroundColor: Theme.of(context).primaryColor,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 125,
                  height : 125,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/logo.png")
                      )
                  ),

                ),
                new Text(FakeData.appNameFarsi , style: TextStyle(fontSize: 20 , color : Colors.white , fontWeight: FontWeight.bold))
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new CircularProgressIndicator(),
              ),
            )
          ],
        )
    );
  }
}