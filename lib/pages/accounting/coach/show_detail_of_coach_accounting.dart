import 'package:club_manager/pages/accounting/coach/activity.dart';
import 'package:club_manager/pages/accounting/coach/card_activity.dart';
import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';

class ShowMonthActivity extends StatefulWidget {
  final monthIndex;
  final coachIndex;

  ShowMonthActivity({this.monthIndex, this.coachIndex});

  @override
  _ShowMonthActivityState createState() => _ShowMonthActivityState();
}

class _ShowMonthActivityState extends State<ShowMonthActivity> {
  List _years =
  ["98", "97", "96", "95", "94"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _year;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _year = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _years) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    coaches[widget.coachIndex].month[widget.monthIndex].paidCost();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context,builder: (context){return addCost(coachIndex: widget.coachIndex,monthIndex: widget.monthIndex);});
          },
          icon: Icon(Icons.add),
          label: Text("اظافه کردن هزینه")),
      body: ListView.builder(
          itemCount: coaches[widget.coachIndex]
              .month[widget.monthIndex]
              .activity
              .length + 1,
          itemBuilder: (context, index) {
            if(index==0){
              return Container(
                height: MediaQuery.of(context).size.height *.08,
                color: coaches[widget.coachIndex].month[widget.monthIndex].cost==0 ? Colors.green : Colors.red,
                child: Center(
                  child: Text(coaches[widget.coachIndex].month[widget.monthIndex].cost.toString(),style: TextStyle(color: Colors.white),),
                ),
              );
            }
            return CardActivity(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CastumDialog(
                          monthIndex: widget.monthIndex,
                          coachIndex: widget.coachIndex,
                          activityIndex: index-1);
                    });
              },
              coachIndex: widget.coachIndex,
              monthIndex: widget.monthIndex,
              activityIndex: index-1,
            );
          }),
    );
  }

  static GlobalKey<FormState> key = GlobalKey<FormState>();

  Widget CastumDialog({int coachIndex, int monthIndex, int activityIndex}) {
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
                            .month[monthIndex]
                            .activity[activityIndex]
                            .isPay = true;
                        coaches[coachIndex]
                            .month[monthIndex]
                            .activity[activityIndex]
                            .transaction = numberOnSaved;
                        coaches[coachIndex]
                            .month[monthIndex]
                            .activity[activityIndex]
                            .details = detaill;
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
                      onSaved: (String str){title = str;},
                      valid: (String str){if(str.length < 2){
                        return "لطفا عنوان مورد نظر خود را وارد کنید";
                      }},
                      icon: Icons.title,
                      label: "عنوان",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.credit_card,
                      label: "هزینه",
                      valid: (String str){
                        if (str.length < 4){
                          return "لطفا مبلغ موذد نظر خود را وارد کنید";
                        }
                      },
                      onSaved: (String str){cost = str;},
                      keyType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal:85.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){
                  setState(() {
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      coaches[coachIndex].month[monthIndex].activity.add(Activity(isPay: false,title: title,cost: cost));
                    }
                  });
                  Navigator.pop(context);
                },
                color: Colors.grey,
                child: Text("اظافه کردن",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
