import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class timePeriod extends StatefulWidget {
  final PageController controller;
  //final func;
  String selectedTime;

  timePeriod({@required this.controller});

  @override
  _timePeriodState createState() => _timePeriodState();
}

class _timePeriodState extends State<timePeriod> {
  int groupValue = 0;
  String notice = "توجه : در ابتدا باید حداقل مبلغ " +
      FakeData.minimumCost.toString() +
      "پرداخت شود";
  final Color gradientEnd = Color(0xff676bc2);
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController controller;

  _timePeriodState({this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        controller.previousPage(
            duration: Duration(milliseconds: 1400), curve: Curves.linear);
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            color: gradientEnd,
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Text(
                      "انتخاب طول دوره",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: groupValue,
                            activeColor: Colors.white,
                            onChanged: radioOnChanged,
                          ),
                          Text("مدت دوره یکساله مبلغ  ",
                              style: TextStyle(color: Colors.white)),
                          Text(
                            FakeData.yerarCost,
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: groupValue,
                            activeColor: Colors.white,
                            onChanged: radioOnChanged,
                          ),
                          Text("مدت دوره شیش ماهه مبلغ  ",
                              style: TextStyle(color: Colors.white)),
                          Text(
                            FakeData.sixMonthCost,
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: groupValue,
                            activeColor: Colors.white,
                            onChanged: radioOnChanged,
                          ),
                          Text(
                            "مدت دوره تابستان مبلغ  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            FakeData.summerCost,
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Form(
                        key: formKey,
                        child: FormTextField(
                          label: "مبلغ",
                          hintText: "لطفا مبلغ مورد نظر خود را وارد کنید",
                          obsecure: false,
                          icon: Icons.credit_card,
                          onSaved: paymentOnSave,
                          keyType:
                              TextInputType.numberWithOptions(signed: false),
                          valid: (String str) {
                            int cost = int.parse(str);
                            if (cost < FakeData.minimumCost) {
                              String error = "تومان باشد" +
                                  FakeData.minimumCost.toString() +
                                  "حداقل میلغ پرداختی باید";
                              return error;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Text(
                      notice,
                      style: TextStyle(color: Colors.amber),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    FlatButton(
                      child: Text(
                        "پرداخت",
                        style: TextStyle(color: gradientEnd, fontSize: 15),
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          if (groupValue == 0) {
                            widget.selectedTime = "یکساله";
                            print("یکساله");
                            //widget.func;
                            //controller.nextPage(duration: null, curve: null);
//                            widget.controller.nextPage(
//                                duration: Duration(milliseconds: 1400),
//                                curve: Curves.linear);
                            Navigator.of(context).pop();
                          } else if (groupValue == 1) {
                            print("شیش ماهه");
                            widget.selectedTime = "شیش ماهه";
                            //widget.func();
//                            widget.controller.nextPage(
//                                duration: Duration(milliseconds: 1400),
//                                curve: Curves.linear);
                            Navigator.of(context).pop();
                          } else if (groupValue == 2) {
                            //widget.func();
                            widget.selectedTime = "دوره تابستان";
                            print("دوره تابستان");
//                            widget.controller.nextPage(
//                                duration: Duration(milliseconds: 1400),
//                                curve: Curves.linear);
                            Navigator.pop(context);
                          }
                        }
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void radioOnChanged(int value) {
    setState(() {
      groupValue = value;

      switch (groupValue) {
        case 0:
          Fluttertoast.showToast(
              msg: FakeData.yerarCost, toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(
              msg: FakeData.sixMonthCost, toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: FakeData.summerCost, toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  int payment;

  paymentOnSave(String str) {
    payment = int.parse(str);
    print(payment);
  }
}
