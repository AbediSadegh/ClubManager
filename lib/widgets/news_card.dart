import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';

class NewsItemPreview extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;
  final String shortDesc;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;
  final _newsItemPreviewState;
  static bool setChange = true;

  NewsItemPreview(
      {this.imgURL,
      this.title,
      this.description,
      this.shortDesc,
      this.onDelete,
      this.onEdit}): _newsItemPreviewState = NewsItemPreviewState();

  State<NewsItemPreview> createState() => _newsItemPreviewState;
}

class NewsItemPreviewState extends State<NewsItemPreview> {
  bool changeActive = true;
  Size deviceSize;

  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Center(
              child: Center(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: deviceSize.width * 0.85,
                      height: deviceSize.height * 0.4,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Stack(
                          children: <Widget>[
                            FadeInImage.assetNetwork(
                              width: deviceSize.width * 0.85,
                              placeholder: 'assets/images/logo.png',
                              image: widget.imgURL,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                            Visibility(
                              visible: changeActive,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
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
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.title,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.shortDesc,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
