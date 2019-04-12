import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/about_page/about_us.dart';
import 'package:club_manager/pages/about_page/update_about.dart';
import 'package:flutter/material.dart';

class AboutTabBar extends StatefulWidget {
  @override
  _AboutTabBarState createState() => _AboutTabBarState();
}

class _AboutTabBarState extends State<AboutTabBar>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: TabBar(
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            controller: controller,
            tabs: [
              Tab(
                child: Text(
                  FakeData.companyName,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
              Tab(
                child: Text(
                  FakeData.programmerName,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Color(0xff37474f),
          child: TabBarView(controller: controller, children: [
            AboutUs("pa"),
            AboutUs("po"),
          ]),
        ));
  }
}
