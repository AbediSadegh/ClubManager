import 'package:club_manager/pages/signup&login/register/notice/notice_form.dart';
import 'package:flutter/material.dart';


class NoticePage extends StatelessWidget {
  final PageController controller;
  final Color gradientEnd = Color(0xff676bc2);
  final press;
  NoticePage({this.controller,this.press});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        controller.previousPage(
            duration: Duration(milliseconds: 1400),
            curve: Curves.linear);
      },
      child: Container(
        color: gradientEnd,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:55.0),
                  child: Text("تذکرات",style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
                NoticeForm(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      onPressed: press,
                      child: Text("تایید موارد فوق",style: TextStyle(color: Colors.deepPurpleAccent,),)),
                ),
              ],
            ),],
          ),
        ),
      ),
    );
  }
}
