import 'package:flutter/material.dart';

class NewsViewer extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;

  NewsViewer({this.imgURL, this.title, this.description});

  State<NewsViewer> createState() => NewsViewerState();
}

class NewsViewerState extends State<NewsViewer> {
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,textDirection: TextDirection.rtl,),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5,vertical: 10.0),
                  width: mediaSize.width * 0.9,
                  height: mediaSize.height * 0.45,
                  child: Hero(
                    tag: widget.imgURL + '__news',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/logo.png',
                        image: widget.imgURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                  child: Text(
                    widget.description,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
