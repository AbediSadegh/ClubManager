import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonMonth extends StatelessWidget {
  final imageUrl;
  final title;
  final startGradientColor;
  final endGradientColor;
  final onTap;

  ButtonMonth(
      {this.imageUrl,
      this.title,
      this.startGradientColor,
      this.endGradientColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width * .30,
        decoration: ShapeDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          shape: CircleBorder(side: BorderSide(color: Colors.green))
              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ,gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              startGradientColor,
              endGradientColor,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
//            BackdropFilter(
//              filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
//              child: new Container(
//                decoration: new ShapeDecoration(
//                    shape: CircleBorder(),
//                    color: Colors.black.withOpacity(0.3)),
//              ),
//            ),
            CircleAvatar(
                radius: 25,
                backgroundColor: Colors.deepPurpleAccent.withOpacity(.6),
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}
