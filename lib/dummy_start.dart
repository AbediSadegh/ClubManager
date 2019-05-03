import 'package:club_manager/pages/signup&login/register/regent_code/regent_code_page.dart';
import 'package:club_manager/pages/signup&login/register/select_time_period/time_period.dart';
import 'package:club_manager/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyStart extends StatefulWidget {
  @override
  _DummyStartState createState() => _DummyStartState();
}

class _DummyStartState extends State<DummyStart> {
  static SharedPreferences pref;
  bool first;

  @override
  void initState() {
    first = true;
    super.initState();
  }

  payChecked() async {
    pref = await SharedPreferences.getInstance();
    String ans = pref.getString('payCheck');
    if (ans == "OK") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TimePeriod();
      }));
    } else if (ans == "NOK" || null == ans) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      try {
        payChecked();
      } catch (e) {}
    }

    return Scaffold(
      body: Container(),
    );
  }
}
