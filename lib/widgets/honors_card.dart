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

  Size deviceSize;

  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 10.5),
      elevation: 3.5,
      child: Column(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/logo.png',
                image: 'https://picsum.photos/500/225?image=143',
                alignment: Alignment.center,
                height: deviceSize.height * 0.25,
                width: deviceSize.width * 0.65,
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
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 25.0, color: Colors.white),
                  ),
                ],
              ),
              width: deviceSize.width,
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Theme.of(context).cardColor,
              ),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.description,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: deviceSize.width,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).dividerColor,
                    ),
                  )
                ],
              ),
            ),
            expanded: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Theme.of(context).cardColor,
                  ),
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.description,
                    softWrap: true,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(Icons.expand_less, color: Theme.of(context).dividerColor)
              ],
            ),
            hasIcon: false,
          ),
        ],
      ),
    );
  }
}
