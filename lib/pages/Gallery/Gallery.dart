import 'package:club_manager/entity/Photograph.dart';
import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dummy/finalpack/GalleryMainView.dart';
//import 'package:flutter_dummy/finalpack/Photograph.dart';
//import 'package:flutter_dummy/finalpack/YearMenu.dart';

class Gallery extends StatelessWidget {
  final Map<String, List<Photograph>> _photos;
  final List<String> _years;
  PhotoGallery _photoGallery;
  Size _deviceSize;

  Gallery(this._photos, this._years);

//  Gallery(@required Map<String, List<Photograph>> photos,
//      @required List<String> years) {
//    _photos = photos;
//    _years = years;
//  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;
    this._photoGallery = PhotoGallery(_photos, _deviceSize);
    assert(_photos.isNotEmpty);
    assert(_years != null);
    return Container(
      child: Stack(
        children: <Widget>[
          YearMenu(this._years, this._photoGallery),
          _photoGallery,
        ],
      ),
    );
  }
}
