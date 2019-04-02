import 'dart:io';

import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/entity/news_entity.dart';
import 'package:club_manager/entity/news_field_entity.dart';
import 'package:club_manager/entity/news_page_entity.dart';
import 'package:club_manager/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class News extends StatefulWidget {
  final NewsPageEntity pager;
  final bool isAdmin;

  News({@required this.pager, @required this.isAdmin});

  @override
  _NewsState createState() => _NewsState();

  ///the following lines of code are for testing
  List newsEntity = [
    FakeData.fakeNewsEntity(10, 0),
    FakeData.fakeNewsEntity(10, 10),
    FakeData.fakeNewsEntity(5, 20)
  ];
}

class _NewsState extends State<News> {
  bool _isChanging = true;
  List<NewsEntity> news;
  int _lastItems;

  @override
  void initState() {
    super.initState();
//    news = // todo initialize the first pieces of news to be shown
    news = widget.newsEntity[0];
    _lastItems = 0;
  }

  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                editAdd(
                    context: context,
                    index: 0,
                    deviceSize: deviceSize,
                    isAdd: true);
              },
            )
          : Container(),
      body: Container(
//        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ListView.builder(
//          itemCount: widget.pager.count, todo uncomment this statement and remove the following one
        itemCount: 25,
          itemBuilder: (context, index) {
            if (index % 10 == 0 && index != 0) {
              if (index > _lastItems) {
//                news = todo get the next set of NewsEntity
                _lastItems++;
                news = widget.newsEntity[_lastItems];
              } else {
                //news = todo get the previous set of NewsEntity
                _lastItems--;
                news = widget.newsEntity[_lastItems];
              }
            }
            return NewsItemPreview(
              title: news[index%10].title,
              image: news[index%10].image,
              subtitle: news[index%10].subtitle,
              url: news[index%10].url,
              id: index,
              onDelete: () {
                setState(() {
                  //todo : delete a piece of news here
                });
              },
              onEdit: () {
                editAdd(
                    context: context,
                    index: index,
                    deviceSize: deviceSize,
                    isAdd: false,
                    item: news[index%10]);
              },
            );
          },
        ),
      ),
    );
  }

  Future editAdd(
      {BuildContext context,
      int index,
      Size deviceSize,
      bool isAdd,
      NewsEntity item}) {
    //NewsFieldEntity newsField = todo get the NewsFieldEntity for editing
    NewsFieldEntity newsField;
    List<File> images = List();
    return showDialog(
        context: context,
        builder: (context) {
          // ignore: unused_local_variable
          TextEditingController ctrlDesc =
              TextEditingController(text: isAdd ? '' : newsField.content);
          TextEditingController ctrlTitle =
              TextEditingController(text: isAdd ? '' : item.title);
          TextEditingController ctrlSubtitle =
              TextEditingController(text: isAdd ? '' : item.subtitle);
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
                            controller: ctrlSubtitle,
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
                                    images.add(await ImagePicker.pickImage(
                                        source: ImageSource.gallery));
                                  },
                                  child: Icon(
                                    Icons.add_a_photo,
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
                          item = NewsEntity((b) => b
                                ..title = ctrlTitle.text
                                ..subtitle = ctrlSubtitle.text
//                              ..url = item.url todo specify a url
//                              ..image = item.image, todo set something for newsEntity image
                              );
                          newsField = NewsFieldEntity(
                            (b) => b
                              ..url = item.url
                              ..title = item.title
                              ..id = newsField.id
                              ..content = ctrlDesc.text
                              ..newsImages = newsField.newsImages.toBuilder(),
                          );
                          //todo handle adding process here
                        } else {
                          // if edit
                          setState(() {
                            item = NewsEntity(
                              (b) => b
                                ..title = ctrlTitle.text
                                ..subtitle = ctrlSubtitle.text
                                ..url = item.url
                                ..image = item.image,
                            );
                            newsField = NewsFieldEntity(
                              (b) => b
                                ..url = item.url
                                ..title = item.title
                                ..id = newsField.id
                                ..content = ctrlDesc.text
                                ..newsImages = newsField.newsImages.toBuilder(),
                            );
                            //todo save these two for editing News
//                            widget.pager[index] = NewsEntity(
//                              imgURL: widget.pager[index].imgURL,
//                              title: ctrlTitle.text,
//                              description: ctrlDesc.text,
//                              shortDesc: ctrlSubtitle.text,
//                            );
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
