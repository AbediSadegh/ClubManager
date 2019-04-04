import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsViewer extends StatefulWidget {
  final String tag;
  final String title;

  NewsViewer({this.tag, this.title});

  State<NewsViewer> createState() => NewsViewerState();
}

class NewsViewerState extends State<NewsViewer> {
  bool isLoading = true;
  NewsEntity newsEntity;
  bool firs = true;

  getNews(String url) async {
    isLoading = true;
    newsEntity = await loadNews(url);
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    if (firs){
      firs = false;
      getNews(widget.tag);
    }
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 7.5, vertical: 10.0),
                        width: mediaSize.width * 0.9,
                        height: mediaSize.height * 0.45,
                        child: Hero(
                          tag: widget.tag,
                          child: CarouselSlider(
                            items: List.generate(
                                newsEntity.newsImages.length,
                                (index) => Image.network(
                                    newsEntity.newsImages[index].newsImage)),
                            aspectRatio: 2.0,
                            viewportFraction: 0.6,
                            reverse: true,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          newsEntity.content,
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
