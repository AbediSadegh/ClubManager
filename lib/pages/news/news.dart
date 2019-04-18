import 'dart:io';

import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/news_entity.dart';
import 'package:club_manager/entity/news_field_entity.dart';
import 'package:club_manager/entity/news_page_entity.dart';
import 'package:club_manager/widgets/background.dart';
import 'package:club_manager/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class News extends StatefulWidget {
  final NewsPageEntity pager;
  final bool isAdmin;

  News({@required this.pager, @required this.isAdmin});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _isLoading;
  String nextPage;
  List<NewsEntity> list;
  bool firstLoad = true;
  ScrollController _listScrollController = new ScrollController();

  @override
  void initState() {
    list = new List();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getNews(page: nextPage);
        }
      }
    });

    super.initState();
  }

  getNews({String page: URL.urlNews}) async {
    _isLoading = true;
    NewsPageEntity newsList = await loadNewsList(page);
    setState(() {
      list.addAll(newsList.results.toList());
      nextPage = newsList.next;
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    if (firstLoad) {
      getNews();
      firstLoad = false;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                itemCount: list.length,
                controller: _listScrollController,
                itemBuilder: (context, index) {
                  return NewsItemPreview(
                    title: list[index].title,
                    image: list[index].image,
                    subtitle: list[index].subtitle,
                    url: list[index].url,
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}
