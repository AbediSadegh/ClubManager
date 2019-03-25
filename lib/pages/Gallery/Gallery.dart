import 'package:club_manager/entity/Photograph.dart';
import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final Map<String, List<Photograph>> photos;
  final List<String> years;

  Gallery({@required this.photos, @required this.years}) {
    assert(years != null && photos != null);
  }


  @override
  Widget build(BuildContext context) {
    Size _deviceSize = MediaQuery.of(context).size;
    PhotoGallery _photoGallery = PhotoGallery(photos, _deviceSize);
    assert(photos.isNotEmpty);
    assert(years != null);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            YearMenu(this.years, _photoGallery),
            _photoGallery,
          ],
        ),
      ),
    );
  }
}
