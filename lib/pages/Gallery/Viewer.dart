import 'package:club_manager/entity/Photograph.dart';
import 'package:flutter/material.dart';

class Viewer extends StatefulWidget {
  final Photograph _photo;
  final Size _deviceSize;

  Viewer(this._photo, this._deviceSize);

  @override
  ViewerState createState() {
    return new ViewerState();
  }
}

class ViewerState extends State<Viewer> {
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _visibility = !_visibility;
                });
              },
              child: Hero(
                // using the photograph photo url itself as a tag
                tag: this.widget._photo.photo,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/logo.png',
                  image: this.widget._photo.photo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _visibility ? 1.0 : 0.0,
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                  alignment: Alignment.topCenter,
                  height: widget._deviceSize.height / 4.0,
                  width: widget._deviceSize.width,
                  child: Text(
                    widget._photo.description,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
