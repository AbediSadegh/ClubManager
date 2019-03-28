import 'package:club_manager/entity/Photograph.dart';
import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final Map<String, List<Photograph>> photos;
  final List<String> years;
  final bool isAdmin;
  static PhotoGallery photoGallery;

  Gallery({@required this.photos, @required this.years,@required this.isAdmin}) {
    assert(years != null && photos != null);
  }

  @override
  Widget build(BuildContext context) {
    Size _deviceSize = MediaQuery.of(context).size;
    photoGallery = PhotoGallery(photos:photos, deviceSize: _deviceSize);
    assert(photos.isNotEmpty);
    assert(years != null);
    return Scaffold(
      floatingActionButton: !isAdmin
          ? Container(width:0.0,height:0.0,)
          : FloatingActionButton.extended(
              onPressed: (){

              },
              icon: Icon(Icons.mode_edit),
              label: Text('تغییرات'),
            ),
      body: Container(
        child: Stack(
          children: <Widget>[
            GalleryBar(this.years, photoGallery),
            photoGallery,
          ],
        ),
      ),
    );
  }
}
