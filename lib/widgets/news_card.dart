import 'package:club_manager/widgets/single_news_view.dart';
import 'package:flutter/material.dart';

class NewsItemPreview extends StatefulWidget {
  final String url;
  final String title;
  final String image;
  final String subtitle;

  NewsItemPreview({this.url, this.title, this.image, this.subtitle})
      : assert(title.isNotEmpty && subtitle.isNotEmpty);

  State<NewsItemPreview> createState() => NewsItemPreviewState();
}

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewsViewer(
                  tag: widget.url,
                  title: widget.title,
                );
              },
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              width: deviceSize.width * 0.85,
              height: deviceSize.height * 0.4,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Hero(
                    tag: widget.url + '__news',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5),
                      child: (widget.image != null && widget.image.isNotEmpty)
                          ? FadeInImage.assetNetwork(
                              width: deviceSize.width * 0.85,
                              placeholder: 'assets/images/logo.png',
                              image: widget.image,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            )
                          : Image.asset(
                              'assets/images/logo.png',
                              width: deviceSize.width * 0.85,
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
              child: Text(widget.title,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.title),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
              child: Text(widget.subtitle,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.body1),
            ),
          ],
        ),
      ),
    );
  }
}
