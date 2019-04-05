import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/photograph.dart';
import 'package:club_manager/pages/Gallery/Viewer.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({this.photo, this.size, this.deviceSize, this.onDelete, this.onEdit});

  final IntSize size;
  final PhotoEntityList photo;
  final Size deviceSize;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;

  @override
  State<Tile> createState() => _TileState(this.size);
}

class _TileState extends State<Tile> {
  static int tileSmallIndex = 5;
  static List<double> l = [1.0, 0.0, 1.0, 0.0, 1.0, 1.0];

  final IntSize size;
  bool _changeActive = false;
  double _fontSize = 15;

  _TileState(this.size);

  @override
  Widget build(BuildContext context) {
    tileSmallIndex = (tileSmallIndex == 5 ? 0 : ++tileSmallIndex);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(
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
                          border: Border.all(color: Colors.grey, width: 1.5)),
                      child: Image.asset(
                        'assets/images/video-player.png',
//                        fit: BoxFit.contain,
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
                        Image.network(widget.photo.image,fit: BoxFit.fill,),
                      ],
                    ),
            ),
          ),
        ),
        _changeActive
            ? editDeleteWidget()
            : Container(
                height: 0.0,
                width: 0.0,
              ),
      ],
    );
  }

  Widget editDeleteWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: size.height - 10,
          width: size.width / 2 - 10,
          child: FlatButton(
            onPressed: widget.onEdit,
            child: Text(
              'ویرایش',
              style: TextStyle(color: Colors.white, fontSize: _fontSize),
            ),
            color: Color.fromRGBO(247, 223, 9, 0.6),
          ),
        ),
        Container(
          height: size.height - 10,
          width: size.width / 2 - 10,
          child: FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteOrNot(
                      onDelete: widget.onDelete,
                    );
                  });
            },
            child: Text(
              'حذف',
              style: TextStyle(color: Colors.white, fontSize: _fontSize),
            ),
            color: Color.fromRGBO(247, 13, 9, 0.6),
          ),
        ),
      ],
    );
  }
}
