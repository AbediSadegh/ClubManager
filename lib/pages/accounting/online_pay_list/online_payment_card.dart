import 'package:club_manager/FakeEntity.dart';
import 'package:flutter/material.dart';

class OnlinePaymentCard extends StatelessWidget {
  final playerIndex;
  final index;

  OnlinePaymentCard({this.playerIndex, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("هزینه : "),
                Text(players[playerIndex].onlinePay[index].cost),
              ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("تاریخ : "),
                Text(players[playerIndex].onlinePay[index].date),
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("شماره پیگیری : "),
                Text(players[playerIndex].onlinePay[index].date),
              ],),
          ],
        ),
      ),
    );
  }
}
