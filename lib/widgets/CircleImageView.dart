import 'dart:ui';

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final IconData iconData;
  final String title;
  final GestureTapCallback gestureTapCallback;
  final Animation<double> animation;
  CircleImage(
      {Key key,
      this.height,
      this.width,
      this.url,
      this.iconData,
      this.gestureTapCallback,
      this.title,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          child: Center(
            child: Container(
              height: animation.value * height,
              width: animation.value * width,
              child: GestureDetector(
                onTap: gestureTapCallback,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(url),
                        ),
                      ),
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: height / 3,
                        width: width / 3,
                        alignment: FractionalOffset(0.0, 0.0),
                        child: Center(child: Icon(iconData)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: animation.value,
          child: Text(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
