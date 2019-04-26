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
              SizedBox(height: MediaQuery.of(context).size.height * .3,),
              Text("در صورت معرفی دو نفر به مدرسه فوتبال پدیده شهرخودرو یکماه شما رایگان خواهد بود",style: TextStyle(color: Colors.white),),
              //todo باید کد معرف از طرف سرور هندل شود
              Text("",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
