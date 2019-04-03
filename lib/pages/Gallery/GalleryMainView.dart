import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/IntSize.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/photograph.dart';
import 'package:club_manager/pages/Gallery/Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path/path.dart';

class PhotoGallery extends StatefulWidget {
  final PhotoGalleryState state = PhotoGalleryState();
  final Map<String, List<Photograph>> photos;
  final Size deviceSize;
  final String initAlbum;
  PhotoGallery(
      {@required this.photos, @required this.deviceSize, this.initAlbum});

  State<PhotoGallery> createState() => state;
}

class PhotoGalleryState extends State<PhotoGallery>
//    with AutomaticKeepAliveClientMixin<PhotoGallery>
{
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  bool fistLoad = true;

  List<IntSize> generator(int quantity, double width, double height) {
    List<IntSize> l = List();
    height = height / 2;
    for (int i = 0; i < quantity; i++)
      l.add(
          IntSize(width / 2, (i % 6 == 0 || i % 6 == 4) ? height : height / 2));
    return l;
  }

  List<PhotoEntityList> _pics;
  String currAlbum;
  PhotoList photoList;
  String nextPage;

  void initState() {
    currAlbum = widget.initAlbum;
    _pics  = new List();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getPhotoes(page: nextPage);
        }
      }
    });
    super.initState();

  }

  getPhotoes({String page: URL.urlGalley}) async {
    _isLoading = true;
    photoList = await loadGallery(page);
    setState(() {
      _pics.addAll(photoList.results);
      nextPage = photoList.next;
      _isLoading = false;
    });
  }

  galleryPageTrans(String page) {
    setState(() {
      currAlbum = page;
    });
  }

  Widget build(BuildContext context) {
  if (fistLoad) {
    getPhotoes();
    fistLoad = false;
  }
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.only(top: 45.0),
              child: Center(
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  List<IntSize> l = generator(_pics.length,
                      constraints.maxWidth, constraints.maxHeight);
                  return custom(l);
                }),
              ),
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
          onDelete: () {
            widget.photos[currAlbum].removeAt(index);
            galleryPageTrans(currAlbum);
          },
          onEdit: () {
            onEdit(context, index);
          },
        );
      },
    );
  }

  Future onEdit(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController controller =
              TextEditingController(text: _pics[index].content);
          return new Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 10.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.black12,
              ),
              height: 3 * widget.deviceSize.height / 7,
              child: new Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: new TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: controller,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45),
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'توضیحات',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      maxLines:
                          (3 * widget.deviceSize.height / 7 - 100).floor(),
                    ),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(58, 58, 62, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        )),
                    alignment: Alignment.center,
                    child: new FlatButton(
                      child: new Text(
                        'ذخیره',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          //todo do the change stuff here
//                          _pics[index] = PhotoEntityList((p) => p
//                            ..photo = _pics[index].file
//                            ..thumbnail = _pics[index].image
//                            ..description = controller.text
//                            ..isVideo = _pics[index].is_video);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}
