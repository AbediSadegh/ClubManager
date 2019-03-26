import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        },

      transitionsBuilder: (
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Interval(0.5, 1,curve: Curves.linear))),
      child: new SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0),
          end: const Offset(0,-1 ),
        ).animate(CurvedAnimation(parent: secondaryAnimation, curve: Interval(0, .5,curve: Curves.linear))),
        child: child,
      ),
    );

  }




















          //////////////////////
//          (BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//            Widget child) {
//          return new SlideTransition(
//            position: new Tween<Offset>(
//              begin: const Offset(0.0, 1.0),
//              end: Offset.zero,
//            ).animate(animation),
//            child: SlideTransition(
//          position: Tween<Offset>(
//          begin: Offset.zero,
//            end: const Offset(0.0, 1.0),
//          ).animate(secondaryAnimation),
//        child: child,
//
//        ),

//////////////////////////
//            child: new SlideTransition(position: new Tween<Offset>(
//            begin: const Offset(0.0, 1.0),
//            end: Offset(0.0, 0.0),
//          ).animate(animation),),
          );


  @override
  Duration get transitionDuration {
    return Duration(milliseconds: 10000);
  }
}
