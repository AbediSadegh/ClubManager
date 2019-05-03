import 'package:flutter/material.dart';
import 'package:club_manager/widgets/expandable.dart';

class HonorsCard extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;

  HonorsCard(
      {@required this.imgURL,
      @required this.title,
      @required this.description,
      this.onDelete,
      this.onEdit});

  State<HonorsCard> createState() => HonorsCardState();
}

class HonorsCardState extends State<HonorsCard> {
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 10.5),
      elevation: 3.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/logo.png',
                  image: widget.imgURL,
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
                width: deviceSize.width * 0.9,
                padding: EdgeInsets.only(right: 5.0),
                alignment: Alignment.centerRight,
                child: Text(
                  widget.title,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              collapsed: Container(
                padding: EdgeInsets.all(3.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.description,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.body1,
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
                    padding: EdgeInsets.all(3.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                    child: Text(
                      widget.description,
                      softWrap: true,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  Icon(Icons.expand_less, color: Theme.of(context).dividerColor)
                ],
              ),
              hasIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
