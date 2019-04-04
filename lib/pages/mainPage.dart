import 'dart:ui';

import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/Exercises/ExercisesScreen.dart';
import 'package:club_manager/pages/Gallery/Gallery.dart';
import 'package:club_manager/pages/about_page/about_main.dart';
import 'package:club_manager/pages/coach_cv/cv_viewer.dart';
import 'package:club_manager/pages/honors/honors.dart';
import 'package:club_manager/pages/news/news.dart';
import 'package:club_manager/pages/signup&login/login/login_dialog.dart';
import 'package:club_manager/pages/support/about_page.dart';

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
                    height: 90,
                    title: "ورود / ثبت نام",
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
                    title: "مربیان",
                    iconData: Icons.supervised_user_circle,
                    url: FakeData.srcImageExercise,
                    gestureTapCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CVViewer(
                                isAdmin: false,
                              ),
                        ),
                      );
                    },
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "اخبار",
                    gestureTapCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => News(
                                pager: null,
                                isAdmin: false,
                              ),
                        ),
                      );
                    },
                    iconData: Icons.whatshot,
                    url: FakeData.newsLogo,
                  ),
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
                    title: "گالری",
                    gestureTapCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Gallery(
//                                photos: FakeData.fakeGallery,
                                years: ['1381', '1382', '1383', '1384'],
                                isAdmin: true,
                              ),
                        ),
                      );
                    },
                    iconData: Icons.photo_album,
                    url: FakeData.galleryLogo,
                  ),
                  CircleImage(
                    gestureTapCallback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExerciseList()));
                    },
                    title: "تمرین",
                    height: 90,
                    width: 90,
                    iconData: Icons.assignment,
                    url: FakeData.news,
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "افتخارات",
                    gestureTapCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HonorView(
                                isAdmin: false,
                              ),
                        ),
                      );
                    },
                    iconData: Icons.stars,
                    url: FakeData.honorsLogo,
                  ),
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
                    title: "پشتیبانی",
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
                    title: "درباره ما",
                    iconData: Icons.info,
                    url: FakeData.news,
                    gestureTapCallback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AboutTabBar();
                          },
                        ),
                      );
                    },
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: "test",
                    iconData: Icons.fiber_new,
                    url: FakeData.news,
                  ),
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
