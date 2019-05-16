import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/single_trainer_cv.dart';

class CVViewer extends StatefulWidget {
  final bool isAdmin;

  CVViewer({@required this.isAdmin});

  @override
  _CVViewerState createState() => _CVViewerState();
}

class _CVViewerState extends State<CVViewer> {
  bool isChanging = false;
  bool _isLoading;
  CoachListEntity coachListEntity;
  List<CoachEntity> list;
  ScrollController _listScrollController = new ScrollController();
  String nextPage;
  bool first;

  getCoachList({String page: URL.urlCoachList}) async {
    _isLoading = true;
    coachListEntity = await loadCoachList(page);
    setState(() {
      list.addAll(coachListEntity.results);
      nextPage = coachListEntity.next;
      _isLoading = false;
    });
  }

  void initState() {
    list = new List();
    first = true;
    _isLoading = true;
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getCoachList(page: nextPage);
        }
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getCoachList();
    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AppBackground(),
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                controller: _listScrollController,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return CV(
                    imgURL: list[index].image,
                    description: list[index].content,
                    license: list[index].level,
                    name: list[index].user.first_name +
                        " " +
                        list[index].user.last_name,
                    education: " ",
                  );
                },
              ),
      ],
    ));
  }
}
