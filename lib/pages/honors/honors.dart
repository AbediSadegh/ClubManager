import 'package:club_manager/widgets/news_honors.dart';
import 'package:flutter/material.dart';

class HonorView extends StatefulWidget {
  final List news;

  HonorView({@required this.news}) : assert(news != null);

  @override
  _HonorViewState createState() => _HonorViewState();
}

class _HonorViewState extends State<HonorView> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BaseItem(
            imgURL: widget.news[index].imgURL,
            title: widget.news[index].title,
            description: widget.news[index].description,
            onDelete: (){
              setState(() {
                widget.news.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}

// 1.778645833333333