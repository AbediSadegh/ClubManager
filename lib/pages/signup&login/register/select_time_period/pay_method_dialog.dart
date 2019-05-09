import 'package:flutter/material.dart';

class PaymentMethodDialog extends StatelessWidget {
  final yesFunction;
  final NoFunction;

  PaymentMethodDialog({this.yesFunction, this.NoFunction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      backgroundColor: Color(0xff676bc2),
      child: Container(
        height: MediaQuery.of(context).size.height * .4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Text(
                  "در صورت پرداخت اقساطی بایستی چک های خود را تا قبل از شروع اولین جلسه به دفتر مدرسه فوتبال واقع در نبش دانشجو 17 تحویل دهید"
              ,style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height*.15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtounForPaymentMethodDialog(color: Colors.green,title: "تایید",function: yesFunction),
                  ButtounForPaymentMethodDialog(color: Colors.red,title: "کنسل",function: NoFunction)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget ButtounForPaymentMethodDialog({final function,final color,final title}){
    return FlatButton(
      child: Text(title,style: TextStyle(color: Colors.white,fontSize: 16),),
      onPressed: function,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textColor: Colors.white,
    );

  }
}
