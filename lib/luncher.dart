import 'package:club_manager/dummy_start.dart';
import 'package:club_manager/pages/mainPage.dart';
import 'package:club_manager/pages/signup&login/register/select_time_period/time_period.dart';
import 'package:club_manager/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shahr khodro',
      theme: ThemeData(
        primaryColor: Color(0xFFF44336),
        primaryColorDark: Color(0xFFD32F2F),
        primaryColorLight: Color(0xFFFF614E),
        //scaffoldBackgroundColor: Color(0xFFFFEB3B),
        backgroundColor: Color(0xff37474f),
//        cardColor: Color(0xff660000),
        //cardColor: Color(0xffED2939),
        accentColor: Color(0xFF444444),
        dividerColor: Color(0xFFBDBDBD),
      ),
      home: DummyStart(),
    );
  }

//  Route<dynamic> _getRoute(RouteSettings settings) {
//    if (settings.name != '/splash_screen') {
//      return null;
//    }
//    return MaterialPageRoute<void>(
//      settings: settings,
//      builder: (BuildContext context) => SplashScreen(),
//      fullscreenDialog: true,
//    );
//  }
}
