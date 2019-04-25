import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';

class CoachFee extends StatefulWidget {
  final double height;
  final double width;
  final String userName;

  CoachFee(
      {@required this.height, @required this.width, @required this.userName});

  @override
  _CoachFeeState createState() => _CoachFeeState();
}

class _CoachFeeState extends State<CoachFee> {
  @override
  Widget build(BuildContext context) {
    if(isLoading){getFee(widget.userName);}
    return Container(
      height: widget.height,
      width: widget.width,
      child: !isLoading  ? Column(
        children: <Widget>[
          createFeeRow(title: "مبلغ کل", subTitle: feeEntity.fee.toString()),
          createFeeRow(
              title: "مبلغ پرداختی", subTitle: feeEntity.pay.toString()),
          Divider(),
          createFeeRow(title: "مبلغ باقیمانده", subTitle: sum.toString()),
        ],
      ) : null,
    );
  }

  Widget createFeeRow({String title, String subTitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Text(subTitle),
        ],
      ),
    );
  }

  bool isLoading = true;
  FeeEntity feeEntity;
  int sum = 0;

  getFee(String userName) async {
    feeEntity = await getFeeEntity(url: URL.getCoachFee, userName: userName);
    sum = feeEntity.fee - feeEntity.pay;
    setState(() {
      isLoading = false;
    });
  }
}
