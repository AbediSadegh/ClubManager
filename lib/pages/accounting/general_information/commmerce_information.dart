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
      elevation: 8,
      backgroundColor:Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: MediaQuery.of(context).size.height *.21,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("مبلغ دریافتی",style: TextStyle(color: Colors.white),),
                  !isLoading ?Text(commerceTotalEntity.inCome.toString(),style: TextStyle(color: Colors.white)) : CircularProgressIndicator(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("مبلغ پرداختی",style: TextStyle(color: Colors.white)),
                  !isLoading ? Text(commerceTotalEntity.outCome.toString(),style: TextStyle(color: Colors.white)) : CircularProgressIndicator(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text("تایید",style: TextStyle(color: Colors.white)),
                onPressed: (){Navigator.pop(context);},
                color: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
