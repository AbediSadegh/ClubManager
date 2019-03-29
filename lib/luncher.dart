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
      home: SplashScreen(),
      initialRoute: "/splash_screen",
      routes: {
        "/mainPage" : (context) => new Directionality(textDirection: TextDirection.rtl, child: MainPage()),

      },

    );
  }
}
//asdasdfasf