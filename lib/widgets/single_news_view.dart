import 'package:club_manager/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsViewer extends StatefulWidget {
  final String tag;
  final List<String> images;
  final String title;
  final String description;
  final int id;

  NewsViewer({this.tag, this.images, this.title, this.description,this.id});

  State<NewsViewer> createState() => NewsViewerState();
}

class NewsViewerState extends State<NewsViewer> {
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5, vertical: 10.0),
                  width: mediaSize.width * 0.9,
                  height: mediaSize.height * 0.45,
                  child: Hero(
                    tag: widget.tag,
                    child: CarouselSlider(
                      items: List.generate(widget.images.length,
                          (index) => Image.network(widget.images[index])),
                      aspectRatio: 2.0,
                      viewportFraction: 0.6,
                      reverse: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
