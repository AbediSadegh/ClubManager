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
  Widget _appBarTitle = new Text('Search Example');
  String _searchText = "";
  final TextEditingController _filter = new TextEditingController();

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
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: _buildBar(context),
              body: _buildList(),
            ),
          );
  }

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
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < studentList.students.length; i++) {
        if (studentList.students[i].first_name
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }
}
