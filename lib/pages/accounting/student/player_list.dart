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
  StudentList studentList;
  Icon _searchIcon = new Icon(Icons.search);
  List names = new List();
  List filteredNames = new List();
  Widget _appBarTitle = new Text('لیست فوتبالیست ها');
  String _searchText = "";
  final TextEditingController _filter = new TextEditingController();

  _PlayerListState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }


  void initState() {
    //getStudentNameList();

    isLoading = true;
    first = true;
    super.initState();
  }

  getStudentNameList({String page: URL.studentList}) async {
    studentList =
        await getStudentList(url: URL.studentList, letter: widget.alephabetic);
    setState(() {
      isLoading = false;
      _getNames();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getStudentNameList();
    }
    return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: _buildBar(context),
              body:isLoading ?   Center(child: CircularProgressIndicator(),):
              _buildList(),
            ),
          );
  }
  //
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search,color:Colors.white,), hintText: 'Search...',hintStyle: TextStyle(color: Colors.white)),
        );
      } else {
        this._searchIcon = new Icon(Icons.search,color: Colors.white,);
        this._appBarTitle = new Text('لیست فوتبالیست ها');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < studentList.students.length; i++) {
        String fullName = studentList.students[i].first_name + " " + studentList.students[i].last_name;
        if (fullName
            .contains(_searchText)) {
          tempList.add(fullName);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]),
          onTap: () => print(filteredNames[index]),
        );
      },
    );
  }
  void _getNames() async {
    List tempList = new List();
    //print(studentList.students.length==null ? "hahaaahhhhhhhhhhhh":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    for (int i = 0; i < studentList.students.length; i++) {
      String fullName = studentList.students[i].first_name + " " + studentList.students[i].last_name;
      tempList.add(fullName);
      //print("hahahahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }
}
