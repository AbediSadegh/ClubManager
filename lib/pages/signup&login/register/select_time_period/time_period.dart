import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TimePeriod extends StatefulWidget {
  final PageController controller;

  //final func;
  String selectedTime;

  TimePeriod({@required this.controller});

  @override
  _TimePeriodState createState() => _TimePeriodState();
}

class _TimePeriodState extends State<TimePeriod> {
  int groupValue = 0;
  String notice = "توجه : در ابتدا باید حداقل مبلغ " +
      FakeData.minimumCost.toString() +
      "پرداخت شود";
  final Color gradientEnd = Color(0xff676bc2);
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController controller;


  static const platform = const MethodChannel('pay');
  String _statePayment = 'Unknown battery level.';

  Future<void> payment() async {
    String statePayment;
    try {
      final int result = await platform.invokeMethod(price);
      statePayment = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      statePayment = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _statePayment = statePayment;
    });
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
                      Text(
                        _statePayment,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Divider(
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Container(
                        height: 300,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
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
                            payment();
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
