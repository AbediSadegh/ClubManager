import 'package:club_manager/pages/mainPage.dart';
import 'package:club_manager/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      initialRoute: "/splash_screen",
      onGenerateRoute: _getRoute,
      routes: {
        "/mainPage": (context) => new Directionality(
            textDirection: TextDirection.rtl, child: MainPage()),
        "/splash_screen": (context) => new Directionality(
            textDirection: TextDirection.rtl, child: SplashScreen()),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/splash_screen') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => SplashScreen(),
      fullscreenDialog: true,
    );
  }
}
//asdasdfasf
