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
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

  static const itemNames = <String>[
    'ورود / ثبت نام',
    'مربیان',
    'اخبار',
    'گالری',
    'تمرین',
    'افتخارات',
    'پشتیبانی',
    'درباره ما',
    'test',
  ];
  static const itemIcons = <IconData>[
    Icons.check,
    Icons.supervised_user_circle,
    Icons.whatshot,
    Icons.photo_album,
    Icons.assignment,
    Icons.stars,
    Icons.call,
    Icons.info,
    Icons.fiber_new,
  ];
  static const itemImages = <String>[
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.jpg',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
  ];
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController _controller;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List<Animation> intervals = <Animation>[];

  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 9);
    int itemsCount = 9;
    _controller = AnimationController(duration: duration, vsync: this)
      ..addListener(() {
        setState(() {});
      });

    for (int i = 0; i < itemsCount; i++) {
      intervals.add(Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(i / itemsCount, (i + 1) / itemsCount,
              curve: Curves.bounceInOut))));
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
                    width: 90,
                    title: MainPage.itemNames[0],
                    iconData: MainPage.itemIcons[0],
                    animation: intervals[0],
                    url: MainPage.itemImages[0],
                    gestureTapCallback: () {
                      openLogin();
                    },
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: MainPage.itemNames[1],
                    iconData: MainPage.itemIcons[1],
                    animation: intervals[1],
                    url: MainPage.itemImages[1],
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
                    title: MainPage.itemNames[2],
                    iconData: MainPage.itemIcons[2],
                    animation: intervals[2],
                    url: MainPage.itemImages[2],
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
                    title: MainPage.itemNames[3],
                    iconData: MainPage.itemIcons[3],
                    animation: intervals[3],
                    url: MainPage.itemImages[3],
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
                  ),
                  CircleImage(
                    gestureTapCallback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExerciseList()));
                    },
                    height: 90,
                    width: 90,
                    title: MainPage.itemNames[4],
                    iconData: MainPage.itemIcons[4],
                    animation: intervals[4],
                    url: MainPage.itemImages[4],
                  ),
                  CircleImage(
                    height: 90,
                    width: 90,
                    title: MainPage.itemNames[5],
                    iconData: MainPage.itemIcons[5],
                    animation: intervals[5],
                    url: MainPage.itemImages[5],
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
                    title: MainPage.itemNames[6],
                    iconData: MainPage.itemIcons[6],
                    animation: intervals[6],
                    url: MainPage.itemImages[6],
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
                    title: MainPage.itemNames[7],
                    iconData: MainPage.itemIcons[7],
                    animation: intervals[7],
                    url: MainPage.itemImages[7],
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
                    title: MainPage.itemNames[8],
                    iconData: MainPage.itemIcons[8],
                    animation: intervals[8],
                    url: MainPage.itemImages[8],
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

  void openLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String token = sp.getString('token');
    if (token == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return loginDialog();
          },
        ),
      );
    } else {
      key.currentState.showSnackBar(SnackBar(
        content: Text("شما وارد شده اید"),
      ));
    }
  }
}
