import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/entity/news_field_entity.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:club_manager/widgets/single_news_view.dart';
import 'package:flutter/material.dart';

class NewsItemPreview extends StatefulWidget {
  final String url;
  final String title;
  final String image;
  final String subtitle;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;
  static bool setChange = true;

  NewsItemPreview(
      {this.url,
      this.title,
      this.image,
      this.subtitle,
      this.onDelete,
      this.id,
      this.onEdit})
      : assert(title.isNotEmpty &&
            onEdit != null &&
            onDelete != null &&
            subtitle.isNotEmpty);

  State<NewsItemPreview> createState() => NewsItemPreviewState();

  /// the following codes are for testing
  List<List<NewsFieldEntity>> fieldsEntity = [
    FakeData.fakeNewsFieldEntity(10, 0),
    FakeData.fakeNewsFieldEntity(10, 10),
    FakeData.fakeNewsFieldEntity(5, 20)
  ];
  final int id;
}

/*
added carousel slider to news section and changed news section functionality a bit
 */

class NewsItemPreviewState extends State<NewsItemPreview> {
  bool changeActive = false;
  Size deviceSize;

  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            //NewsFieldEntity _temp = todo get the NewsFieldEntity of this item
            NewsFieldEntity _temp =
                widget.fieldsEntity[(widget.id / 10).floor()][widget.id % 10];
            print('LOLOLOLO');
            print(_temp.newsImages.toList().toString());
            print('DONE DONE');
            return NewsViewer(
              tag: widget.url,
              title: _temp.title,
              images: _temp.newsImages.toList(),
              description: _temp.content,
            );
          }));
        },
        child: Column(
          children: <Widget>[
            Container(
              width: deviceSize.width * 0.85,
              height: deviceSize.height * 0.4,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Hero(
                        tag: widget.url + '__news',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.5),
                          child: FadeInImage.assetNetwork(
                            width: deviceSize.width * 0.85,
                            placeholder: 'assets/images/logo.png',
                            image: widget.image,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: changeActive,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: deviceSize.width / 3 - 10,
                            height: deviceSize.height * 0.4,
                            child: FlatButton(
                              color: Color.fromRGBO(247, 223, 9, 0.6),
                              onPressed: widget.onEdit,
                              child: Text(
                                'ویرایش',
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: deviceSize.width / 3 - 10,
                            height: deviceSize.height * 0.4,
                            child: FlatButton(
                              color: Color.fromRGBO(247, 13, 9, 0.6),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DeleteOrNot(
                                        onDelete: widget.onDelete,
                                      );
                                    });
                              },
                              child: Text(
                                'حذف',
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(
                        widget.title,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.subtitle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
