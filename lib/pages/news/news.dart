import 'dart:io';

import 'package:club_manager/entity/news_entity.dart';
import 'package:club_manager/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class News extends StatefulWidget {
  final List<NewsEntity> news;
  final bool isAdmin;

  News({@required this.news, @required this.isAdmin}) : assert(news != null);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _isChanging = true;

  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                editAdd(context, 0, deviceSize, true);
              },
            )
          : Container(),
      body: Container(
//        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ListView.builder(
          itemCount: widget.news.length,
          itemBuilder: (context, index) {
            return NewsItemPreview(
              imgURL: widget.news[index].imgURL,
              title: widget.news[index].title,
              description: widget.news[index].description,
              shortDesc: widget.news[index].shortDesc,
              onDelete: () {
                setState(() {
                  //todo : delete a piece of news here
                  widget.news.removeAt(index);
                });
              },
              onEdit: () {
                editAdd(context, index, deviceSize, false);
              },
            );
          },
        ),
      ),
    );
  }

  Future editAdd(BuildContext context, int index, Size deviceSize, bool isAdd) {
    return showDialog(
        context: context,
        builder: (context) {
          File image;
          TextEditingController ctrlDesc = TextEditingController(
              text: isAdd ? '' : widget.news[index].description);
          TextEditingController ctrlTitle = TextEditingController(
              text: isAdd ? '' : widget.news[index].title);
          TextEditingController ctrlShortDesc = TextEditingController(
              text: isAdd ? '' : widget.news[index].shortDesc);
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
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
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            maxLines: 6),
                      )),
                  Container(
                    width: deviceSize.width,
                    height: 1.0,
                    color: Color.fromRGBO(58, 58, 62, 1.0),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: new TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: ctrlShortDesc,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black45),
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'توضیح مختصر',
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            maxLines: 6),
                      )),
                  Container(
                    width: deviceSize.width,
                    height: 1.0,
                    color: Color.fromRGBO(58, 58, 62, 1.0),
                  ),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: new TextFormField(
                                keyboardType: TextInputType.multiline,
                                controller: ctrlTitle,
                                textAlign: TextAlign.right,
                                style: TextStyle(color: Colors.black45),
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'تیتر',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                maxLines: 6),
                          ),
                          Positioned(
                            bottom: 5.0,
                            left: 5.0,
                            child: Visibility(
                              visible: isAdd,
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
                          ),
                        ],
                      )),
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
                        if (isAdd) {
                          //todo add image here
                        } else {
                          setState(() {
                            widget.news[index] = NewsEntity(
                              imgURL: widget.news[index].imgURL,
                              title: ctrlTitle.text,
                              description: ctrlDesc.text,
                              shortDesc: ctrlShortDesc.text,
                            );
                            //todo do the change stuff here
                          });
                        }
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
