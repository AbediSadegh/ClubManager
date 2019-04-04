import 'dart:io';

import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/cv_entity.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/single_trainer_cv.dart';
import 'package:image_picker/image_picker.dart';

class CVViewer extends StatefulWidget {
  final bool isAdmin;

  CVViewer({@required this.isAdmin});

  @override
  _CVViewerState createState() => _CVViewerState();
}

class _CVViewerState extends State<CVViewer> {
  bool isChanging = false;
  bool _isLoading;
  CoachListEntity coachListEntity;
  List<CoachEntity> list;
  ScrollController _listScrollController = new ScrollController();
  String nextPage;
  bool first;

  getCoachList({String page: URL.urlcoachList}) async {
    _isLoading = true;
    coachListEntity = await loadCoachList(page);
    setState(() {
      list.addAll(coachListEntity.results);
      nextPage = coachListEntity.next;
      _isLoading = false;
    });
  }

  void initState() {
    list = new List();
    first = true;
    _isLoading = true;
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getCoachList(page: nextPage);
        }
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getCoachList();
    }
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: Icon(Icons.mode_edit),
              onPressed: () {
//                editAdd(
//                  isAdd: true,
//                  context: context,
//                  deviceSize: MediaQuery.of(context).size,
//                );
              },
            )
          : Container(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _listScrollController,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CV(
                  imgURL: list[index].image,
                  description: list[index].content,
                  license: list[index].level,
                  name: list[index].user.first_name +
                      " " +
                      list[index].user.last_name,
                  education: " ",
                  onEdit: () {
//                    editAdd(
//                        deviceSize: MediaQuery.of(context).size,
//                        context: context,
//                        index: index,
//                        isAdd: false);
                  },
                  onDelete: () {
                    //todo : delete a Coach CV here
                    setState(() {
//                      widget.cvs.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
//
//  Future editAdd(
//      {BuildContext context,
//      int index,
//      Size deviceSize, // can be any of description, name, license, education
//      bool isAdd}) {
//    File image;
//    TextEditingController ctrlName =
//        TextEditingController(text: isAdd ? '' : widget.cvs[index].name);
//    TextEditingController ctrlEdu =
//        TextEditingController(text: isAdd ? '' : widget.cvs[index].education);
//    TextEditingController ctrlLicense =
//        TextEditingController(text: isAdd ? '' : widget.cvs[index].license);
//    TextEditingController ctrlDesc =
//        TextEditingController(text: isAdd ? '' : widget.cvs[index].description);
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return Dialog(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(15.0)),
//            elevation: 10.0,
//            child: Container(
//              decoration: ShapeDecoration(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(15.0)),
//                color: Colors.black12,
//              ),
//              height: deviceSize.height / 2,
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 5.0),
//                    child: Expanded(
//                      flex: 1,
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            flex: 2,
//                            child: TextFormField(
//                              keyboardType: TextInputType.multiline,
//                              controller: ctrlName,
//                              textAlign: TextAlign.right,
//                              decoration: InputDecoration(
//                                hintText: 'نام',
//                                border: UnderlineInputBorder(
//                                    borderSide: BorderSide.none),
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 2,
//                            child: TextFormField(
//                              keyboardType: TextInputType.multiline,
//                              controller: ctrlEdu,
//                              textAlign: TextAlign.right,
//                              decoration: InputDecoration(
//                                hintText: 'تحصیلات',
//                                border: UnderlineInputBorder(
//                                    borderSide: BorderSide.none),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 5.0),
//                    child: Expanded(
//                      flex: 1,
//                      child: TextFormField(
//                        keyboardType: TextInputType.multiline,
//                        controller: ctrlLicense,
//                        textAlign: TextAlign.right,
//                        decoration: InputDecoration(
//                          hintText: 'مدرک مربی گری',
//                          border:
//                              UnderlineInputBorder(borderSide: BorderSide.none),
//                        ),
//                        maxLines: 1,
//                      ),
//                    ),
//                  ),
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 5.0),
//                    child: Expanded(
//                      flex: 4,
//                      child: Stack(children: <Widget>[
//                        TextFormField(
//                          keyboardType: TextInputType.multiline,
//                          controller: ctrlDesc,
//                          textAlign: TextAlign.right,
//                          decoration: InputDecoration(
//                            hintText: 'توضیحات',
//                            border: UnderlineInputBorder(
//                                borderSide: BorderSide.none),
//                          ),
//                          maxLines: 10,
//                        ),
//                        Positioned(
//                          bottom: 0,
//                          left: 5.0,
//                          child: Visibility(
//                            visible: isAdd,
//                            child: ClipOval(
//                              child: FlatButton(
//                                color: Color.fromRGBO(58, 58, 62, 1.0),
//                                onPressed: () async {
//                                  image = await ImagePicker.pickImage(
//                                      source: ImageSource.gallery);
//                                },
//                                child: Icon(
//                                  Icons.photo_camera,
//                                  color: Colors.white,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ]),
//                    ),
//                  ),
//                  Container(
//                    width: deviceSize.width,
//                    decoration: ShapeDecoration(
//                      color: Color.fromRGBO(58, 58, 62, 1.0),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.only(
//                            bottomLeft: Radius.circular(10.0),
//                            bottomRight: Radius.circular(10.0)),
//                      ),
//                    ),
//                    child: FlatButton(
//                      onPressed: () {
//                        if (isAdd) {
//                          //todo do the server side for adding
//                        } else {
//                          //todo do the server side for CV edit
//                          setState(() {
//                            widget.cvs[index] = CVEntity((p) => p
//                              ..imgURL = widget.cvs[index].imgURL
//                              ..description = ctrlDesc.text
//                              ..license = ctrlLicense.text
//                              ..name = ctrlName.text
//                              ..education = ctrlEdu.text);
//                          });
//                        }
//                        Navigator.pop(context);
//                      },
//                      child: Text('ذخیره'),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        });
//  }
}
