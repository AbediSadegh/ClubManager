import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/Gallery/Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoGallery extends StatefulWidget {
  final PhotoGalleryState state = PhotoGalleryState();

  final Size deviceSize;
  bool fistLoad;
  final GestureTapCallback onChange;
  final CategoryItem categoryItem;

  PhotoGallery(
      {this.fistLoad = true,
      @required this.deviceSize,
      @required this.onChange,
      @required this.categoryItem});

  State<PhotoGallery> createState() => state;
}

class PhotoGalleryState extends State<
    PhotoGallery>
{
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();

  List<IntSize> l;
  List<PhotoEntityList> _pics;
  PhotoList photoList;
  String nextPage;
  int id;

  List<IntSize> generator(int quantity, double width, double height) {
    List<IntSize> l = List();
    height = height / 2;
    for (int i = 0; i < quantity; i++)
      l.add(
          IntSize(width / 2, (i % 6 == 0 || i % 6 == 4) ? height : height / 2));
    return l;
  }

  void initState() {
    _pics = new List();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getPhotos(page: nextPage);
        }
      }
    });
    super.initState();
  }

  getPhotos({String page: URL.urlGalley}) async {
    _isLoading = true;
    int id = widget.categoryItem.id;
    photoList = await loadGallery(url: page, id: id);
    if (_pics.length == 0) {
    } else
      _pics.removeRange(0, _pics.length);
    setState(() {
      _pics.addAll(photoList.results);
      nextPage = photoList.next;
      _isLoading = false;
    });
    l = generator(
        _pics.length, widget.deviceSize.width, widget.deviceSize.height);
  }

  Widget build(BuildContext context) {
    if (widget.fistLoad) {
      getPhotos();
      widget.fistLoad = false;
    }
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : Container(
              child: custom(l),
            ),
    );
  }

  Widget custom(List<IntSize> l) {
    return StaggeredGridView.builder(
      controller: _listScrollController,
      itemCount: l.length,
      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
          staggeredTileCount: l.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2)),
      itemBuilder: (context, index) {
        if (index >= l.length) return null;
        return Tile(
          photo: _pics[index],
          size: l[index],
          deviceSize: widget.deviceSize,
        );
      },
    );
  }
}
