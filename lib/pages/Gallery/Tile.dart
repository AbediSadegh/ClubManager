import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/Gallery/Viewer.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({this.photo, this.size, this.deviceSize});

  final IntSize size;
  final PhotoEntityList photo;
  final Size deviceSize;

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
              builder: (context) =>
                  Viewer(widget.photo, widget.deviceSize))),
      child: Container(
        margin: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0),
        width: size.width,
        height: size.height,
        child: Hero(
          tag: widget.photo.file,
          child: widget.photo.is_video
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  child: Image.asset(
                    'assets/images/video-player.png',
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                    Image.network(
                      widget.photo.image,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
