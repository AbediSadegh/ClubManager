import 'package:club_manager/pages/accounting/coach/activity.dart';
import 'package:club_manager/pages/accounting/coach/card_activity.dart';
import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:unicorndial/unicorndial.dart';

class ShowMonthActivity extends StatefulWidget {
  final yearIndex = 0;
  final monthIndex;
  final coachIndex;

  ShowMonthActivity({this.monthIndex, this.coachIndex});

  @override
  _ShowMonthActivityState createState() => _ShowMonthActivityState();
}

class _ShowMonthActivityState extends State<ShowMonthActivity> {
  @override
  Widget build(BuildContext context) {
    coaches[widget.coachIndex]
        .yearActivity[widget.yearIndex]
        .month[widget.monthIndex]
        .paidCost();

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
            coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].hozoor++;
            setState(() {
              String date = "جلسه ی " +
                  PersianDate.now().toString(showDate: true, showTime: false);
              coaches[widget.coachIndex]
                  .yearActivity[widget.yearIndex]
                  .month[widget.monthIndex]
                  .activity
                  .add(Activity(
                    text: Text("حضور",style: TextStyle(color: Colors.green),),
                    title: date,
                    cost: coaches[widget.coachIndex].attendanceTrueCost,
                    isPay: false,
                  ));
            });
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "تاخیر",
        currentButton: FloatingActionButton(
            onPressed: () {
              coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].delay++;
              setState(() {
                String date = "جلسه ی " +
                    PersianDate.now().toString(showDate: true, showTime: false);
                coaches[widget.coachIndex]
                    .yearActivity[widget.yearIndex]
                    .month[widget.monthIndex]
                    .activity
                    .add(Activity(
                      text: Text("تاخیر",style: TextStyle(color: Colors.orange),),
                      title: date,
                      cost: coaches[widget.coachIndex].delayCost,
                      isPay: false,
                    ));
              });
            },
            heroTag: "تاخیر",
            backgroundColor: Colors.orange,
            mini: true,
            child: Icon(Icons.error_outline))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "غیبت",
        currentButton: FloatingActionButton(
          heroTag: "غیبت",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.close),
          onPressed: () {
            coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].absent++;
            setState(() {
              String date = "جلسه ی " +
                  PersianDate.now().toString(showDate: true, showTime: false);
              coaches[widget.coachIndex]
                  .yearActivity[widget.yearIndex]
                  .month[widget.monthIndex]
                  .activity
                  .add(Activity(
                    text: Text("غیبت",style: TextStyle(color: Colors.red),),
                    title: date,
                    cost: coaches[widget.coachIndex].attendanceFalseCost,
                    isPay: false,
                  ));
            });
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "پرداخت",
        currentButton: FloatingActionButton(
          heroTag: "پرداخت",
          backgroundColor: Colors.blue,
          mini: true,
          child: Icon(Icons.credit_card),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return addCost(
                      monthIndex: widget.monthIndex,
                      coachIndex: widget.coachIndex);
                });
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
            showDialog(
                context: context,
                builder: (context) {
                  return absentInformation();
                });
          },
        )));
    return Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      body: ListView.builder(
          itemCount: coaches[widget.coachIndex]
                  .yearActivity[widget.yearIndex]
                  .month[widget.monthIndex]
                  .activity
                  .length +
              1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: MediaQuery.of(context).size.height * .08,
                color: coaches[widget.coachIndex]
                            .yearActivity[widget.yearIndex]
                            .month[widget.monthIndex]
                            .cost <=
                        0
                    ? Colors.green
                    : Colors.red,
                child: Center(
                  child: Text(
                    coaches[widget.coachIndex]
                        .yearActivity[widget.yearIndex]
                        .month[widget.monthIndex]
                        .cost
                        .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
            return CardActivity(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return costumDialog(
                          monthIndex: widget.monthIndex,
                          coachIndex: widget.coachIndex,
                          activityIndex: index - 1);
                    });
              },
              coachIndex: widget.coachIndex,
              monthIndex: widget.monthIndex,
              activityIndex: index - 1,
            );
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
                        coaches[coachIndex]
                            .yearActivity[widget.yearIndex]
                            .month[monthIndex]
                            .activity[activityIndex]
                            .isPay = true;
//                        coaches[coachIndex]
//                        .yearActivity[widget.yearIndex]
//                            .month[monthIndex]
//                            .activity[activityIndex]
//                            .transaction = numberOnSaved;
//                        coaches[coachIndex]
//                        .yearActivity[widget.yearIndex]
//                            .month[monthIndex]
//                            .activity[activityIndex]
//                            .details = detaill;
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
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: FormTextField(
//                      onSaved: (String str) {
//                        title = str;
//                      },
//                      valid: (String str) {
//                        if (str.length < 2) {
//                          return "لطفا عنوان مورد نظر خود را وارد کنید";
//                        }
//                      },
//                      icon: Icons.title,
//                      label: "عنوان",
//                    ),
//                  ),
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
                      setState(() {
                        coaches[coachIndex]
                            .yearActivity[widget.yearIndex]
                            .month[monthIndex]
                            .activity
                            .add(Activity(
                                isPay: true,
                                title: "پرداخت",
                                cost: cost,
                                text:  Text("پرداخت",style: TextStyle(color: Colors.blue),)));
                      });
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
  Widget absentInformation(){
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
                  Text("تعداد جلسات حضور",style: TextStyle(color: Colors.white),),
                  Text(coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].hozoor.toString(),style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("تعداد جلسات تاخیر",style: TextStyle(color: Colors.white)),
                  Text(coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].delay.toString(),style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("تعداد جلسات غبیت",style: TextStyle(color: Colors.white)),
                  Text(coaches[widget.coachIndex].yearActivity[widget.yearIndex].month[widget.monthIndex].absent.toString(),style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            FlatButton(
              child: Text("تایید",style: TextStyle(color: Colors.white),),
              onPressed: (){Navigator.pop(context);},
              color: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ),
    );
  }
}
