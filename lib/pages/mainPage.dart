import 'dart:ui';

import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/widgets/CircleImageView.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            buildHeaderText(FakeData.appNameFarsi),
            SizedBox(height: 10,),
            buildDesText(FakeData.des),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleImage(
                  gestureTapCallback: (){
                    print("salam");
                  },
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),
                CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                )
              ],
            ),
            SizedBox(height: 15,)
            ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),
                CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                )
              ],
            ),
            SizedBox(height: 15,)
            ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),
                CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                ),CircleImage(
                  height: 90,
                  width: 90,
                  iconData: Icons.fiber_new,
                  url: FakeData.news,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderText(String text) {
    return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 80),
            child: Text(
              text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
  }

  Container buildDesText(String text) {
    return Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          );
  }
}
