import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/student/pass_dialog.dart';
import 'package:flutter/material.dart';

class DemandNoteInformation extends StatefulWidget {
  @override
  _DemandNoteInformationState createState() => _DemandNoteInformationState();
}

class _DemandNoteInformationState extends State<DemandNoteInformation> {
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  bool fistLoad = true;
  bool dialogLoading = false;
  List<CheckEntity> checkList;
   CheckListEntity checkListEntity;
  String nextPage;

  void initState() {
    checkList = new List();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getChecks(page: nextPage);
        }
      }
    });
    super.initState();
  }

  getChecks({String page: URL.checkList}) async {
    _isLoading = true;
    checkListEntity = await getCheckList(page);
    setState(() {
      checkList.addAll(checkListEntity.results);
      nextPage = checkListEntity.next;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (fistLoad){
      fistLoad = false;
      getChecks();
    }
    return Scaffold(
      body: ListView.builder(
          itemCount: checkList.length,
          itemBuilder: (context , index){
            return GestureDetector(
              onLongPress: (){
                if(checkList[index].is_passed ==false ) {
                showDialog(context: context,builder: (context){ return PassDialog(
                  yesPress: (){setState(() {
                    checkList[index].is_passed = true;
                    Navigator.pop(context);
                  });},
                  cancelPress:(){Navigator.pop(context);},

                );});
                }
              },
              child:  Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: MediaQuery.of(context).size.height * .20,
                  width: MediaQuery.of(context).size.width * .85,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        createRow(
                            Text(checkList[index].name),
                            Text("نام نویسنده چک")),
                        createRow(
                            Text(checkList[index].date==null ? " " : checkList[index].date),
                            Text("تاریخ")),
                        createRow(
                            checkList[index].is_passed
                                ? Text(
                              "پاس شده",
                              style: TextStyle(color: Colors.green),
                            )
                                : Text(
                              "پاس نشده",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text("وضعیت")),
                        createRow(
                            Text(checkList[index].price.toString()),
                            Text("مبلغ")),
                      ],
                    ),
                  ),
                ),
              ),
            );

          }),
    );
  }

  Widget createRow(Text text1, Text text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text1,
        text2,
      ],
    );
  }
}
