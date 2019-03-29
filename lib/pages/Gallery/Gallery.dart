import 'dart:io';

import 'package:club_manager/entity/photograph.dart';
import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatelessWidget {
  final Map<String, List<Photograph>> photos;
  final List<String> years;
  final bool isAdmin;
  static PhotoGallery photoGallery;

  Gallery(
      {@required this.photos, @required this.years, @required this.isAdmin}) {
    assert(years != null && photos != null);
  }

  @override
  Widget build(BuildContext context) {
    assert(photos.isNotEmpty);
    assert(years != null);
    Size _deviceSize = MediaQuery.of(context).size;
    photoGallery = PhotoGallery(photos: photos, deviceSize: _deviceSize,initAlbum: years[0],);
    return Scaffold(
      floatingActionButton: !isAdmin
          ? Container(
              width: 0.0,
              height: 0.0,
            )
          : FloatingActionButton(
              onPressed: () {add(context,_deviceSize);},
              child: Icon(Icons.add),
            ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Stack(
          children: <Widget>[
            GalleryBar(years: years,photoGallery:  photoGallery,initValue: years[0],),
            photoGallery,
          ],
        ),
      ),
    );
  }

  Future add(BuildContext context, Size deviceSize) {
    return showDialog(
        context: context,
        builder: (context) {
          File image;
          TextEditingController ctrlDesc = TextEditingController();
          TextEditingController ctrlTitle = TextEditingController();
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black12),
              height: deviceSize.height / 2,
              child: new Column(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.5),
                        child: new TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: ctrlDesc,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black45),
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'توضیحات',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                            maxLines: 6),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: FlatButton(
                        color: Color.fromRGBO(58, 58, 62, 1.0),
                        onPressed: () async {
                          image = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                        },
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                      ),
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
                        //todo add image here
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
