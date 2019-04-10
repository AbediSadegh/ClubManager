import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class accounting extends StatefulWidget {
  @override
  _accountingState createState() => _accountingState();
}

class _accountingState extends State<accounting> {
  var childButtons = List<UnicornButton>();

  @override
  Widget build(BuildContext context) {
    salary();
    return ListView.builder(
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
              setState(() {
                print(cardList.length);
                    cardList.removeAt(index);
                    print(cardList.length);
              });
//              print("remove");
//              showDialog(context: context,builder: (context){return DeleteOrNot(
//                onDelete: () {
//                  setState(() {
//                    print(cardList.length);
//                    cardList.removeAt(index);
//                    print(cardList.length);
//                  });
//                },
//              );});
            },
          );
        }
      },
    );

  }
  int pardakhti = 0 ;
  int daryafti = 0;
  salary(){
    daryafti = 0;
    pardakhti = 0;
    for(int i = 0 ; i < cardList.length ; i++){
      cardList[i].isSalary ? pardakhti += int.parse(cardList[i].cost) : daryafti += int.parse(cardList[i].cost);
    }
  }
}
