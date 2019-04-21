import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';
class absentInformationDialog extends StatefulWidget {
  final String Date;
  final String userName;


  absentInformationDialog({this.Date, this.userName});

  @override
  _absentInformationDialogState createState() => _absentInformationDialogState();
}

class _absentInformationDialogState extends State<absentInformationDialog> {
  bool isLoading = true;
  MonthAttendanceEntity monthAttendanceEntity;
  @override
  Widget build(BuildContext context) {

    MonthAttendance({String page: URL.attendance})async{
      String userName = widget.userName;
      String date = widget.Date;
      monthAttendanceEntity = await getMonthAttendance(username: userName,url: page,date: date);
      setState(() {
        isLoading = false;
      });

    }
    if(isLoading){
      MonthAttendance();
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      backgroundColor: Colors.blueGrey,
      child: !isLoading  ? Container(
        height: MediaQuery.of(context).size.height * .25,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "تعداد جلسات حضور",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                      monthAttendanceEntity.presence.toString(),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text("تعداد جلسات تاخیر",
//                      style: TextStyle(color: Colors.white)),
//                  Text(
//                      coaches[widget.coachIndex]
//                          .yearActivity[widget.yearIndex]
//                          .month[widget.monthIndex]
//                          .delay
//                          .toString(),
//                      style: TextStyle(color: Colors.white)),
//                ],
//              ),
//            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("تعداد جلسات غبیت",
                      style: TextStyle(color: Colors.white)),
                  Text(
                      monthAttendanceEntity.absence.toString(),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            FlatButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ) : Container(child: CircularProgressIndicator(),),
    );
  }
}
