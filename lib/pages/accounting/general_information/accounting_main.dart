import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/accounting/general_information/addSalary.dart';
import 'package:club_manager/pages/accounting/page1/accounting_home_page.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() =>
    runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: AccountingHomePage()));

class Example extends StatefulWidget {
  _Example createState() => _Example();
}

class _Example extends State<Example> {
  static GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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
            showDialog(
                context: context,
                builder: (context) {
                  return Salary(
                    costOnSaved: costOnSaved,
                    titleOnSaved: titleOnSaved,
                    onPress: (){
                      if (globalKey.currentState.validate()) {
                        globalKey.currentState.save();
                        setState(() {
                          cardList.add(AccountingCard(
                            cost: cost,
                            time: DateTime.now().toIso8601String(),
                            isSalary: true,
                            date: "1398/01/01",
                            title: title,
                          )
                          );
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    isSalary: true,
                    globalKey: globalKey,
                  );
                });
          },
        ))
    );

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "دریافتی",
        currentButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Salary(
                      costOnSaved: costOnSaved,
                      titleOnSaved: titleOnSaved,
                      onPress: (){
                        if (globalKey.currentState.validate()) {
                          globalKey.currentState.save();
                          setState(() {
                            cardList.add(AccountingCard(
                              cost: cost,
                              time: DateTime.now().toIso8601String(),
                              isSalary: false,
                              date: "1398/01/01",
                              title: title,
                            )
                            );
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      isSalary: false,
                      globalKey: globalKey,
                    );
                  });
            },
            heroTag: "دریافتی",
            backgroundColor: Colors.green,
            mini: true,
            child: Icon(Icons.assessment))));
//    childButtons.add(UnicornButton(
//        hasLabel: true,
//        labelText: "وضعیت افراد",
//        currentButton: FloatingActionButton(
//            onPressed: () {
//              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                return PlayerList();
//              }));
//            },
//            heroTag: "وضعیت افراد",
//            backgroundColor: Colors.green,
//            mini: true,
//            child: Icon(Icons.person))));

//    childButtons.add(UnicornButton(
//        hasLabel: true,
//        labelText: "وضعیت مربی ها",
//        currentButton: FloatingActionButton(
//            onPressed: () {
//              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                return CoachList();
//              }));
//            },
//            heroTag: "وضعیت مربی ها",
//            backgroundColor: Colors.green,
//            mini: true,
//            child: Icon(Icons.person))));
    salary();
    return Scaffold(
      //backgroundColor: Colors.deepPurpleAccent,
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
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: ListView.builder(
          itemCount: cardList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              );
            }
            if (index == 1) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .41,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "پرداختی ها",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  pardakhti.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .41,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "دریافتی ها",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  daryafti.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            }
            if (index > 1) {
              return GestureDetector(
                child: cardList[index - 2],
                onLongPress: () {
//                setState(() {
//                  print(cardList.length);
//                  cardList.removeAt(index-2);
//                  print(cardList.length);
//                });
//              print("remove");
                showDialog(context: context,builder: (context){return DeleteOrNot(
                  onDelete: () {
                    setState(() {
                      print(cardList.length);
                      cardList.removeAt(index);
                      print(cardList.length);
                    });
                  },
                );});
                },
              );
            }
          },
        ),
      ),
    );
  }
  int pardakhti = 0 ;
  int daryafti = 0;
  salary(){
    daryafti = 0;
    pardakhti = 0;
    for(int i = 0 ; i < cardList.length ; i++){
      cardList[i].isSalary ? daryafti += int.parse(cardList[i].cost) : pardakhti += int.parse(cardList[i].cost);
    }
  }
  String title;
  String cost;

  titleOnSaved(String str) {
    title = str;
  }

  costOnSaved(String str) {
    cost = str;
  }
    Future<Null> refreshList() async {
      refreshKey.currentState?.show(atTop: false);
      await Future.delayed(Duration(seconds: 2));

      setState(() {
//        list = List.generate(random.nextInt(10), (i) => "Item $i");
      });
  }
}
