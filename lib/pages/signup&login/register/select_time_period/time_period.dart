import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/LoginData.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:club_manager/pages/signup&login/register/regent_code/regent_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimePeriod extends StatefulWidget {
  final PageController controller;

  //final func;
  String selectedTime;

  TimePeriod({@required this.controller});

  @override
  _TimePeriodState createState() => _TimePeriodState();
}

class _TimePeriodState extends State<TimePeriod> {
  int groupValue = 1;
  int paymentMethod = 0;
  bool isLoadingPayment;

  String notice = "توجه : در ابتدا در صورت پرداخت نقدی باید حداقل مبلغ " +
      FakeData.minimumCost.toString() +
      " تومان پرداخت شود";
  final Color gradientEnd = Color(0xff676bc2);
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController controller;

  static const platform = const MethodChannel('pay');
  static const checkPaymentMethodChanel = const MethodChannel('check');
  String _statePayment = 'انتخاب دوره مورد نظر';

  Future<void> payment() async {
    setState(() {
      isLoadingPayment = true;
    });
    if (paymentMethod == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return RegentCodePage();
      }));
    } else {
      print("payOnline");
      String statePayment;
      try {
        final int result = await platform.invokeMethod(groupValue.toString());
      } on PlatformException catch (e) {}

      setState(() {
        _statePayment = statePayment;
      });
    }
  }
void savePhoneNumber()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', LoginData.username);
}
  void checkPayment() async {
    try {
      final int result = await checkPaymentMethodChanel.invokeMethod(groupValue.toString());
      setState(() {
        if (result == 1) {
          savePhoneNumber();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return RegentCodePage();
          }));
        } else {
          setState(() {
            isLoadingPayment = false;
          });
        }
      });
    } on PlatformException catch (e) {}
  }

  _TimePeriodState({this.controller});

  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  bool fistLoad = true;
  PeriodListEntity periodListEntity;
  String nextPage;
  List<PeriodEntity> periodList;

  getPlaneList({String page: URL.getPeriods}) async {
    _isLoading = true;
    periodListEntity = await getPlane(url: page);
    setState(() {
      periodList.addAll(periodListEntity.results);
      nextPage = periodListEntity.next;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    periodList = new List();
    isLoadingPayment = false;
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getPlaneList(page: nextPage);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (fistLoad) {
      fistLoad = false;
      getPlaneList();
      checkPayment();
    }
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        controller.previousPage(
            duration: Duration(milliseconds: 1400), curve: Curves.linear);
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: gradientEnd,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _statePayment,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                      Divider(
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .35,
                        child: ListView.builder(
                          controller: _listScrollController,
                          itemCount: periodList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Radio(
                                    value: periodList[index].price,
                                    groupValue: groupValue,
                                    activeColor: Colors.white,
                                    onChanged: radioOnChanged,
                                  ),
                                  Text(
                                      convertDate(
                                              periodList[index].first_date) +
                                          " الی " +
                                          convertDate(
                                              periodList[index].end_date),
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    periodList[index].price.toString() +
                                        " تومن ",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "انتخاب روش پرداخت",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Radio(
                                activeColor: Colors.white,
                                value: 0,
                                groupValue: paymentMethod,
                                onChanged: paymentValueOnChange),
                            Text(
                              "پرداخت نفدی",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        notice,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Radio(
                                activeColor: Colors.white,
                                value: 1,
                                groupValue: paymentMethod,
                                onChanged: paymentValueOnChange),
                            Text("پرداخت اقساطی",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
//                      Text(
//                        notice,textAlign: TextAlign.center,
//                        style: TextStyle(color: Colors.amber,fontSize: 15),
//                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: isLoadingPayment
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "پرداخت",
                                  style: TextStyle(
                                      color: gradientEnd, fontSize: 15),
                                ),
                          onPressed: () {
                            payment();
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
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
    });
  }

  void paymentValueOnChange(int value) {
    print("work seccess");
    setState(() {
      paymentMethod = value;
    });
  }

  String price;

  paymentOnSave(String str) {
    price = str;
    print(payment);
  }

  String convertDate(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(4, 6);
    String day = date.substring(6, 8);
    return year + "/" + month + "/" + day;
  }
}
