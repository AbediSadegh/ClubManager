import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/Photograph.dart';
import 'package:club_manager/pages/Gallery/Viewer.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_dummy/finalpack/IntSize.dart';
//import 'package:flutter_dummy/finalpack/Photograph.dart';
//import 'package:flutter_dummy/finalpack/Viewer.dart';

class Tile extends StatefulWidget {
  Tile(this._photo, this.size, this._deviceSize);

  final IntSize size;
  final Photograph _photo;
  final Size _deviceSize;

  @override
  State<Tile> createState() => _TileState(this.size);
}

class _TileState extends State<Tile> {
  static int tileSmallIndex = 5;
  static List<double> l = [1.0, 0.0, 1.0, 0.0, 1.0, 1.0];

  final IntSize size;

  _TileState(this.size);

  @override
  Widget build(BuildContext context) {
    tileSmallIndex = (tileSmallIndex == 5 ? 0 : ++tileSmallIndex);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Viewer(widget._photo, widget._deviceSize))),
      child: Container(
        margin: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0),
        width: size.width,
        height: size.height,
        child: Hero(
          tag: widget._photo.photo,
          child: Container(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/logo.png',
              image: widget._photo.thumbnail,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
