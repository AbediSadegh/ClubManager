import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/accounting/general_information/addSalary.dart';
import 'package:club_manager/pages/accounting/general_information/commmerce_information.dart';
import 'package:club_manager/pages/accounting/page1/accounting_home_page.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false, home: AccountingHomePage()));

class Example extends StatefulWidget {
  _Example createState() => _Example();
}

class _Example extends State<Example> {
  static GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  String clickMode;
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  bool fistLoad = true;
  bool dialogLoading = false;
  List<CommerceList> commerceList;
  CommerceList commerceEntity;
  CommerceListEntity commerceListEntity;
  String nextPage;

  void initState() {
    commerceList = new List();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        if (!_isLoading && nextPage != null) {
          getCommerce(page: nextPage);
        }
      }
    });
    super.initState();
  }

  getCommerce({String page: URL.commerceList}) async {
    _isLoading = true;
    commerceListEntity = await getCommerceList(page);
    setState(() {
      commerceList.addAll(commerceListEntity.results);
      nextPage = commerceListEntity.next;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "پرداختی",
        currentButton: FloatingActionButton(
          heroTag: "پرداختی",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.assignment_late),
          onPressed: () {
            clickMode = "p";
            showDialog(
                context: context,
                builder: (context) {
                  return Salary(
                    isLoading: dialogLoading,
                    costOnSaved: costOnSaved,
                    titleOnSaved: titleOnSaved,
                    onPress: () {
                      if (globalKey.currentState.validate()) {
                        globalKey.currentState.save();
                        sendCommerce();
                      }
                    },
                    isSalary: true,
                    globalKey: globalKey,
                  );
                });
          },
        )));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "دریافتی",
        currentButton: FloatingActionButton(
          heroTag: "دریافتی",
          backgroundColor: Colors.green,
          mini: true,
          child: Icon(Icons.assignment_late),
          onPressed: () {
            clickMode = "d";
            showDialog(
                context: context,
                builder: (context) {
                  return Salary(
                    isLoading: dialogLoading,
                    costOnSaved: costOnSaved,
                    titleOnSaved: titleOnSaved,
                    onPress: () {
                      if (globalKey.currentState.validate()) {
                        globalKey.currentState.save();
                        sendCommerce();
                      }
                    },
                    isSalary: true,
                    globalKey: globalKey,
                  );
                });
          },
        )));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "صورتحساب",
        currentButton: FloatingActionButton(
          heroTag: "صورتحساب",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.assignment_late),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context){
                return getCommerceTotalDialog();
              }
            );
          },
        )));
    salary();
    if (fistLoad) {
      fistLoad = false;
      getCommerce();
    }
    return Scaffold(
      key: key,
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "حسابداری",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _listScrollController,
              itemCount: commerceList.length,
              itemBuilder: (context, index) {
                return AccountingCard(
                    title: commerceList[index].title,
                    date: "1397/02/09",
                    isSalary: commerceList[index].is_income,
                    cost: commerceList[index].price.toString());
              },
            ),
    );
  }

  int pardakhti = 0;
  int daryafti = 0;

  salary() {
    daryafti = 0;
    pardakhti = 0;
    for (int i = 0; i < cardList.length; i++) {
      cardList[i].isSalary
          ? daryafti += int.parse(cardList[i].cost)
          : pardakhti += int.parse(cardList[i].cost);
    }
  }

  String title;
  String cost;

  titleOnSaved(String str) {
    title = str;
  }

  sendCommerce() async {
    setState(() {
      dialogLoading = true;
    });
    commerceEntity = await createCommerce(
        url: URL.commerceCreate,
        price: cost,
        title: title,
        is_income: clickMode == "p" ? false : true);
    if (commerceEntity != null) {
      fistLoad = true;
      commerceList.clear();
      key.currentState.showSnackBar(SnackBar(
        content: Text("درخواست شما ثبت شد "),
      ));
    } else {
      key.currentState.showSnackBar(SnackBar(
        content: Text("خطا در برقراری ارتباط با سرور "),
      ));
    }

    setState(() {
      dialogLoading = false;
    });
  }

  costOnSaved(String str) {
    cost = str;
  }
}
