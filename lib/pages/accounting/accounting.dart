import 'package:club_manager/pages/accounting/accountin_card.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class accounting extends StatelessWidget {
  var childButtons = List<UnicornButton>();

  @override
  Widget build(BuildContext context) {
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
                          "99999999999",
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
                          "99999999999",
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
              print("remove");
              showDialog(context: context,builder: (context){return DeleteOrNot(
                onDelete: () {
                  cardList.removeAt(index);
                },
              );});
            },
          );
        }
      },
    );
  }
}
