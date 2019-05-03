import 'package:club_manager/pages/signup&login/register/regent_code/regent_code_page.dart';
import 'package:club_manager/pages/signup&login/register/select_time_period/time_period.dart';
import 'package:club_manager/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyStart extends StatelessWidget {
  static SharedPreferences pref;

  payChecked(context) async {
    pref = await SharedPreferences.getInstance();
    String ans = pref.getString('payCheck');
    if (ans=="paid"){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return RegentCodePage();
      }));
    }else if (ans=="notPaid"){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return TimePeriod();
      }));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return SplashScreen();
      }));
    }

  }

  @override
  Widget build(BuildContext context) {
    payChecked(context);
    return Container();
  }
}
