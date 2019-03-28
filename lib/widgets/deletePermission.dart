import 'package:flutter/material.dart';

class DeleteOrNot extends StatelessWidget {
  final GestureTapCallback onDelete;

  DeleteOrNot({this.onDelete});

  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Color.fromRGBO(58, 58, 62, 1.0),
          ),
          height: MediaQuery.of(context).size.height / 5,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(

                      alignment: Alignment.center,
                      child: Text(
                    'از این حذف مطمئنید؟',
                        style: TextStyle(color: Colors.white),
                  ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('خیر',style: TextStyle(color:Colors.white)),
                  ),
                  Container(width: 15,),
                  RaisedButton(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () {
                      onDelete();
                      Navigator.pop(context);
                    },
                    child: Text('بله',style: TextStyle(color:Colors.white),),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
