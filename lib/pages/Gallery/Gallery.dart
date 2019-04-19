import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:club_manager/widgets/background.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
//  final Map<String, List<Photograph>> photos;
  final List<String> years;
  final bool isAdmin;

  Gallery({@required this.years, @required this.isAdmin}) {
    assert(years != null);
  }

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String currAlbum;

  @override
  void initState() {
    currAlbum = widget.years[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    assert(photos.isNotEmpty);
    assert(widget.years != null);
    Size _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            GalleryTopBar(
              currVal: currAlbum,
              years: widget.years,
              onChange: (str) {
                if (str != currAlbum) {
                  this.setState(() {
                    currAlbum = str;
                  });
                }
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            AppBackground(),
            PhotoGallery(
              currAlbum: currAlbum,
              deviceSize: _deviceSize,
              onChange: () {
                this.setState(() {});
              },
            ),
          ],
        ));
  }
}
