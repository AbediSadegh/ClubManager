import 'package:flutter/material.dart';

class PassDialog extends StatefulWidget {
  final yesPress;
  final cancelPress;
  bool isLoading;
  PassDialog({this.yesPress, this.cancelPress,this.isLoading});

  @override
  _PassDialogState createState() => _PassDialogState();
}

class _PassDialogState extends State<PassDialog> {
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
           widget.isLoading ? Center(child: CircularProgressIndicator(),) :  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "بله",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  onPressed: widget.yesPress,
                ),
                FlatButton(
                  child: Text(
                    "خیر",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.red,
                  onPressed: widget.cancelPress,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
