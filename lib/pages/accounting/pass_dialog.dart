import 'package:flutter/material.dart';

class PassDialog extends StatelessWidget {
  final yesPress;
  final cancelPress;


  PassDialog({this.yesPress, this.cancelPress});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
        width: MediaQuery.of(context).size.width * .15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("آیا از پاس شدن چک اطمینان دارید؟"),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text("بله",style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  onPressed: yesPress,
                ),
                FlatButton(
                  child: Text("خیر",style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.red,
                  onPressed: cancelPress,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
