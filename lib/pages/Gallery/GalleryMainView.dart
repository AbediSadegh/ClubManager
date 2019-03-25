import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/Photograph.dart';
import 'package:club_manager/pages/Gallery/Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoGallery extends StatefulWidget {
  final PhotoGalleryState state = PhotoGalleryState();
  final Map<String, List<Photograph>> _photos;
  final Size _deviceSize;

  PhotoGallery(this._photos, this._deviceSize);

  State<PhotoGallery> createState() => state;
}

class PhotoGalleryState extends State<PhotoGallery> {
  List<IntSize> generator(int quantity, double width, double height) {
    List<IntSize> l = List();
    height = height / 2;
    for (int i = 0; i < quantity; i++)
      l.add(
          IntSize(width / 2, (i % 6 == 0 || i % 6 == 4) ? height : height / 2));
    return l;
  }

  List<Photograph> _pics;

  galleryPageTrans(String page) {
    setState(() {
      _pics = widget._photos[page];
      print('PICTURES : $_pics}');
    });
  }

  Widget build(BuildContext context) {
    if (_pics == null) return SizedBox();
    return Container(
      padding: EdgeInsets.only(top: 45.0),
      child: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          List<IntSize> l = generator(
              _pics.length, constraints.maxWidth, constraints.maxHeight);
          return custom(l);
        }),
      ),
    );
  }

  Widget custom(List<IntSize> l) {
    print('IT IS CUSTOM GALLERY : ${l.length}');
    return StaggeredGridView.builder(
      itemCount: l.length,
      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
          staggeredTileCount: l.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2)),
      itemBuilder: (context, index) {
        if (index >= l.length) return null;
        return Tile(_pics[index], l[index], widget._deviceSize);
      },
    );
  }
}
