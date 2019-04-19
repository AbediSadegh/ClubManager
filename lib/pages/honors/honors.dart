import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/widgets/background.dart';
import 'package:club_manager/widgets/honors_card.dart';
import 'package:flutter/material.dart';

class HonorView extends StatefulWidget {
  final bool isAdmin;

  HonorView({@required this.isAdmin});

  @override
  _HonorViewState createState() => _HonorViewState();
}

class _HonorViewState extends State<HonorView> {
  bool isLoading = true;
  FameList fameList;
  List<FameEntity> list;
  String nextPage;
  ScrollController _listScrollController = new ScrollController();
  bool first;

  @override
  void initState() {
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!isLoading && nextPage != null) {
          getFameList(page: nextPage);
        }
      }
    });
    first = true;
    list = new List();
    super.initState();
  }

  getFameList({String page: URL.urlFame}) async {
    isLoading = true;
    fameList = await loadFade(page);
    setState(() {
      list.addAll(fameList.results);
      nextPage = fameList.next;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getFameList();
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            controller: _listScrollController,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return BaseItem(
                imgURL: list[index].image,
                title: list[index].title,
                description: list[index].content,
              );
            },
          )
        ],
      ),
    );
  }
}
