import 'package:club_manager/LoginData.dart';
import 'package:club_manager/pages/mainPage.dart';
import 'package:flutter/material.dart';

class RegentCodePage extends StatelessWidget {
  final Color gradientEnd = Color(0xff676bc2);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: gradientEnd,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              Text("کد معرف",style: TextStyle(color: Colors.white,fontSize: 30)),
              SizedBox(height: MediaQuery.of(context).size.height * .2,),
              Text("در صورت معرفی دو نفر به مدرسه فوتبال پدیده شهرخودرو یکماه شما رایگان خواهد بود",style: TextStyle(color: Colors.white),),
              //todo باید کد معرف از طرف سرور هندل شود
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              Text(LoginData.username,style: TextStyle(color: Colors.white),),
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              FlatButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),child: Text("بازگشت به صفحه اصلی",style: TextStyle(color: Colors.purple),),color: Colors.white,
              onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){return MainPage();}));
              },),
            ],
          ),
        ),
      ),
    );
  }
}
