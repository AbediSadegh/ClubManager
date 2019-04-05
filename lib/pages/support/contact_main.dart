
import 'package:club_manager/pages/support/about_page.dart';
import 'package:club_manager/pages/support/contact_programmer/about_page.dart';
import 'package:flutter/material.dart';

class ContctTabBar extends StatefulWidget {
  @override
  _ContactTabBarState createState() => _ContactTabBarState();
}

class _ContactTabBarState extends State<ContctTabBar> with TickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(controller: _controller,
          tabs:[
            Tab(child: Text("پدیده",style: TextStyle(color: Colors.black),),),
            Tab(child: Text("برنامه",style: TextStyle(color: Colors.black),)),
          ]
      ),
      body: TabBarView(
          controller: _controller,
          children: [
        AboutPage(),
        ContactProgrammer(),
      ]),
    );
  }
}
