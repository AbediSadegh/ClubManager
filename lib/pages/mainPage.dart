import 'dart:ui';

import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/ExercisesScreen.dart';
import 'package:club_manager/pages/about/about_page.dart';
import 'package:club_manager/pages/signup&login/login/login_dialog.dart';
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
            SizedBox(
              height: 50,
            ),
            buildHeaderText(FakeData.appNameFarsi),
            SizedBox(
              height: 10,
            ),
            buildDesText(FakeData.des),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleImage(
                    gestureTapCallback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExerciseList()));
                    },
                    title: "تمرین",
                    height: 90,
                    width: 90,
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleImage(
                    height: 90,
                    title: "ورود",
                    width: 90,
                    iconData: Icons.check,
                    url: FakeData.loginUrl,
                    gestureTapCallback: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return loginDialog();
                      }));
                    },
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "تماس با ما",
                    iconData: Icons.call,
                    url: FakeData.callUs,
                    gestureTapCallback: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AboutPage();
                      }));
                    },
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderText(String text) {
    return Container(
      alignment: Alignment.center,
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
