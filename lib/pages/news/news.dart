import 'package:club_manager/widgets/news_honors.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final List news;
  final bool isAdmin;

  News({@required this.news, @required this.isAdmin}) : assert(news != null);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BaseItem(
            imgURL: widget.news[index].imgURL,
            title: widget.news[index].title,
            description: widget.news[index].description,
            onDelete: () {
              setState(() {
                //todo : delete a piece of news here
                widget.news.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
