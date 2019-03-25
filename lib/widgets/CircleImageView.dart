import 'dart:ui';

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final IconData iconData;
  final String title;
  final GestureTapCallback gestureTapCallback;
  CircleImage({Key key, this.height, this.width, this.url, this.iconData, this.gestureTapCallback, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            GestureDetector(
              onTap: gestureTapCallback,
              child: Container(
                width: width,
                height: height,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(url),
                  ),
                ),
                child: ClipOval(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX:1.5, sigmaY: 1.5),
                    child: new Container(
                      decoration:
                          new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ),
            ),

            Container(height: height/3,width: width/3,
                alignment: new FractionalOffset(0.0, 0.0),
                child: Center(child: Icon(iconData)),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                )),
          ],
        ),
        SizedBox(height: 4,),
        Text(title,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)
      ],
    );
  }
}
