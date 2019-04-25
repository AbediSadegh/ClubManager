import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';
class getCommerceTotalDialog extends StatefulWidget {
  @override
  _getCommerceTotalDialogState createState() => _getCommerceTotalDialogState();
}

class _getCommerceTotalDialogState extends State<getCommerceTotalDialog> {
  bool isLoading = true;
  CommerceTotalEntity commerceTotalEntity;
  getTotalCommerce()async{
    commerceTotalEntity= await getCommerceTotal(url: URL.getTotalCommerce);
    setState(() {
      isLoading= false;
    });
  }


  @override
  Widget build(BuildContext context) {
    getTotalCommerce();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: MediaQuery.of(context).size.height *.35,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("مبلغ دریافتی"),
                  !isLoading ?Text(commerceTotalEntity.inCome.toString()) : CircularProgressIndicator(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("مبلغ پرداختی"),
                  !isLoading ? Text(commerceTotalEntity.outCome.toString()) : CircularProgressIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
