import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/coach/new_coach_profile.dart';
import 'package:flutter/material.dart';

class CoachList extends StatefulWidget {
  @override
  _CoachListState createState() => _CoachListState();
}

class _CoachListState extends State<CoachList> {
  bool isChanging = false;
  bool _isLoading;
  CoachListEntity coachListEntity;
  List<CoachEntity> list;
  ScrollController _listScrollController = new ScrollController();
  String nextPage;
  bool first;

  getCoachList({String page: URL.urlcoachList}) async {
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

  @override
  Widget build(BuildContext context) {
    if (first){
      first = false;
      getCoachList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "انتخاب مربی",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _listScrollController,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NewCoachProfile(
                        index: index,
                      );
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    child: Text(list[index].user.last_name.length >=1 ? list[index].user.last_name.substring(0,1) :  list[index].user.last_name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text( list[index].user.first_name +
                      " " +
                      list[index].user.last_name),
                );
              }),
    );
  }
}
