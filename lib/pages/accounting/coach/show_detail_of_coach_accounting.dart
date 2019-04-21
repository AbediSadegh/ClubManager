import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/coach/activity.dart';
import 'package:club_manager/pages/accounting/coach/card_activity.dart';
import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:unicorndial/unicorndial.dart';

class ShowMonthActivity extends StatefulWidget {
  final String userName;
  final String month;
  final String year;

  ShowMonthActivity({this.userName, this.month, this.year});

  @override
  _ShowMonthActivityState createState() => _ShowMonthActivityState();
}

class _ShowMonthActivityState extends State<ShowMonthActivity> {
  bool _isLoading;
  PresenceEntity presenceEntity;
  ShowMonthActivityList monthActivity;
  AttendanceEntity attendanceEntity;
bool first;
  void presence({bool presence}) async {
    _isLoading = true;
    presenceEntity = await setPresence(
        url: URL.setPresence,
        userName: widget.userName,
        attendance: presence,
        date: widget.year + widget.month + "01");
    setState(() {
      _isLoading = false;
      first = true;
    });
  }
  void totalPayment({bool presence}) async {
    _isLoading = true;
    presenceEntity = await setPresence(
        url: URL.setPresence,
        userName: widget.userName,
        attendance: presence,
        date: widget.year + widget.month + "01");
    setState(() {
      _isLoading = false;
      first = true;
    });
  }
  void attendance({String userName, BuildContext context}) async {
    _isLoading = true;
    attendanceEntity = await getAttendance(
        url: URL.attendance,
        username: widget.userName,
        date: widget.year + widget.month + "01");
    setState(() {
      _isLoading = false;
      first = true;
    });
    showDialog(
        context: context,
        builder: (context) {
          return absentInformation();
        });
  }

  @override
  void initState() {
    first = true;
    _isLoading = false;
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "حضور",
        currentButton: FloatingActionButton(
          heroTag: "حضور",
          backgroundColor: Colors.green,
          mini: true,
          child: Icon(Icons.check),
          onPressed: () {
            presence(presence: true);
          },
        )));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "غیبت",
        currentButton: FloatingActionButton(
          heroTag: "غیبت",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.close),
          onPressed: () {
            presence(presence: false);
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "اطلاعات",
        currentButton: FloatingActionButton(
          heroTag: "اطلاعات",
          backgroundColor: Colors.blue,
          mini: true,
          child: Icon(Icons.info),
          onPressed: () {
            attendance(context: context);
          },
        )));

    getCoachDetailOfMonthList({String page: URL.coachpay}) async {
      String username = widget.userName;
      monthActivity =
          await getCoachDetailOfMonth(url: page, username: username);
      setState(() {
        isLoading = false;
      });
    }

    if (first) {
      getCoachDetailOfMonthList();
    }
    return Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: monthActivity.monthActivty.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green,
                                width: double.infinity,
                                height: double.infinity,
                                child: Center(
                                  child: Text("1"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red,
                                width: double.infinity,
                                height: double.infinity,
                                child: Center(
                                  child: Text("1"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CardActivity(
                        onLongPress: null,
                        date: monthActivity.monthActivty[index].date,
                        id: monthActivity.monthActivty[index].id,
                        price: monthActivity.monthActivty[index].price,
                      )
                    ],
                  );
                } else {
                  return CardActivity(
                    onLongPress: null,
                    date: monthActivity.monthActivty[index].date,
                    id: monthActivity.monthActivty[index].id,
                    price: monthActivity.monthActivty[index].price,
                  );
                }
              }),
    );
  }

  static GlobalKey<FormState> key = GlobalKey<FormState>();

  Widget costumDialog({int coachIndex, int monthIndex, int activityIndex}) {
    final DialogHeight = MediaQuery.of(context).size.height * .45;
    String numberOnSaved;
    String detaill;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.blueGrey,
      child: Container(
        height: DialogHeight,
        child: ListView(
          children: <Widget>[
            Container(
              height: DialogHeight * .25,
              child: Center(
                child: Text(
                  "پرداخت",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            Form(
              key: key,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      label: "توضیحات",
                      icon: Icons.info,
                      valid: (String str) {
                        if (str.length < 2) {
                          return "لطفا توضیحات خود را وارد کنید";
                        }
                      },
                      onSaved: (String str) {
                        detaill = str;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.credit_card,
                      keyType: TextInputType.number,
                      valid: (String str) {
                        if (str.length != 6) {
                          return "گد پیگیری اشتباه است";
                        }
                      },
                      label: "شماره پیگیری",
                      onSaved: (String str) {
                        numberOnSaved = str;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "تایید",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      if (key.currentState.validate()) {
                        key.currentState.save();
                        Navigator.of(context).pop();
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String title;
  String cost;
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget addCost({int coachIndex, int monthIndex}) {
    final dialogHeight = MediaQuery.of(context).size.height * .35;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.blueGrey,
      child: Container(
        height: dialogHeight,
        child: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.credit_card,
                      label: "هزینه",
                      valid: (String str) {
                        if (str.length < 4) {
                          return "لطفا مبلغ موذد نظر خود را وارد کنید";
                        }
                      },
                      onSaved: (String str) {
                        cost = str;
                      },
                      keyType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 85.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  setState(() {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                    }
                  });
                  Navigator.pop(context);
                },
                color: Colors.grey,
                child: Text(
                  "اظافه کردن",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget absentInformation() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      backgroundColor: Colors.blueGrey,
      child: Container(
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
                  Text(attendanceEntity.presence.toString(),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("تعداد جلسات غبیت",
                      style: TextStyle(color: Colors.white)),
                  Text(attendanceEntity.absence.toString(),
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
      ),
    );
  }
}
