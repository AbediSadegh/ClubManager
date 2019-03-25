import 'package:club_manager/widgets/news_honors.dart';
import 'package:flutter/material.dart';

class HonorView extends StatelessWidget {
  final List<BaseItem> news;

  HonorView({@required this.news}) : assert(news != null);

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BaseItem(
            imgURL: news[index].imgURL,
            title: news[index].title,
            description: news[index].description,
          );
        },
      ),
    );
  }
}
