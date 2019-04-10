import 'package:club_manager/FakeEntity.dart';
import 'package:flutter/material.dart';

class OnlinePaymentCard extends StatelessWidget {
  final playerIndex;
  final index;

  OnlinePaymentCard({this.playerIndex, this.index});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: MediaQuery.of(context).size.height *.15,
          width: MediaQuery.of(context).size.width *.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("مبلغ : "),
                    Text(players[playerIndex].generalPayment[index].onlinePayment.cost),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("تاریخ : "),
                    Text(players[playerIndex].generalPayment[index].onlinePayment.date),
                ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("شماره پیگیری : "),
                    Text(players[playerIndex].generalPayment[index].onlinePayment.date),
                  ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
