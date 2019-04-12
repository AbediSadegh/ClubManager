import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/student/profile.dart';
import 'package:flutter/material.dart';

class PlayerList extends StatefulWidget {
  final String alephabetic;


  PlayerList({this.alephabetic});

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  bool isLoading;
  bool first;
  StudentName studentList;

  void initState() {
    isLoading = true;
    first = true;
    super.initState();
  }

  getStudentNameList({String page: URL.studentList}) async {
    studentList =
    await getStudentList(url: URL.studentList, letter: widget.alephabetic);
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getStudentNameList();
    }
    return  isLoading ? Center(child: CircularProgressIndicator(),) : Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.alephabetic,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
              itemCount: studentList.students.length,
              itemBuilder: (context, index) {
                print(widget.alephabetic);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return Profile(
                        index: index,
                      );
                    }));
                  },
                  title: Text(
                      studentList.students[index]),
                  //isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                );
              }),
        ),
      );
    }
  }

