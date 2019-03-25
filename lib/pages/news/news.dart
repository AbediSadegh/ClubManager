import 'package:flutter/material.dart';
import 'package:club_manager/pages/honors/expandable.dart';

class NewsItem extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;

  NewsItem(
      {@required this.imgURL,
      @required this.title,
      @required this.description});

  State<NewsItem> createState() => NewsItemState();
}

class NewsItemState extends State<NewsItem> {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 3.5,
      child: Column(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/logo.png',
                image: widget.imgURL,
                alignment: Alignment.center,
                height: size.height / 2,
                width: size.width,
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
              alignment: Alignment.centerRight,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 25.0, color: Color.fromRGBO(100, 100, 150, 1)),
              ),
              width: size.width,
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.description,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                  ),
                  Container(
                    width: size.width,
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
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
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
