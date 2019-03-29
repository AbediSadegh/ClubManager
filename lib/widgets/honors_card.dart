import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/expandable.dart';

class BaseItem extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;

  BaseItem(
      {@required this.imgURL,
      @required this.title,
      @required this.description,
      this.onDelete,
      this.onEdit});

  State<BaseItem> createState() => BaseItemState();
}

class BaseItemState extends State<BaseItem> {
  final _editActive = true;

  Size deviceSize;

  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3.5, horizontal: 7.5),
      elevation: 3.5,
      child: Column(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/logo.png',
                image: widget.imgURL,
                alignment: Alignment.center,
                height: deviceSize.height / 2,
                width: deviceSize.width,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          ),
          ExpandablePanel(
            header: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _editActive
                      ? RaisedButton(
                          elevation: 7.5,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return new DeleteOrNot(
                                    onDelete: widget.onDelete,
                                  );
                                });
                          },
                          child: Text(
                            'حذف',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color.fromRGBO(58, 58, 62, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        )
                      : Container(),
                  Container(
                    width: deviceSize.width / 15,
                  ),
                  _editActive
                      ? RaisedButton(
                          elevation: 7.5,
                          onPressed: widget.onEdit,
                          child: Text(
                            'ویرایش',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color.fromRGBO(58, 58, 62, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        )
                      : Container(),
                  Container(
                    width: deviceSize.width / 15,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromRGBO(100, 100, 150, 1)),
                  ),
                ],
              ),
              width: deviceSize.width,
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.description,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                  ),
                  Container(
                    width: deviceSize.width,
                    alignment: Alignment.center,
                    child: Icon(Icons.expand_more),
                  )
                ],
              ),
            ),
            expanded: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white),
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.description,
                    softWrap: true,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Icon(Icons.expand_less)
              ],
            ),
            hasIcon: false,
          ),
        ],
      ),
    );
  }
}
