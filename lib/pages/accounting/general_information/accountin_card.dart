import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';

class AccountingCard extends StatelessWidget {
  final String title;
  final bool isSalary;
  final String date;
  final String time;
  final String cost;


  AccountingCard({this.cost,this.title, this.isSalary, this.date, this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height *.20,
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(child: Text(title),width: MediaQuery.of(context).size.width*.6,),
                Container(child: Text(" موضوع ",style: TextStyle(color: Colors.blueAccent),),width: MediaQuery.of(context).size.width*.2,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(child: Text(date),width: MediaQuery.of(context).size.width*.6,),
                Container(child: Text(" تاریخ ",style: TextStyle(color: Colors.blueAccent),),width: MediaQuery.of(context).size.width*.2),
              ],
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Container(child: Text(time),width: MediaQuery.of(context).size.width*.6,),
//                Container(child: Text(" تایم ",style: TextStyle(color: Colors.blueAccent)),width: MediaQuery.of(context).size.width*.2,),
//              ],
//            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(child: Text(cost,style: TextStyle(color: isSalary ? Colors.green : Colors.red),),width: MediaQuery.of(context).size.width*.6,),
                Container(child: Text(isSalary ? "دریافتی" : "پرداختی",style: TextStyle(color: isSalary ? Colors.green : Colors.red)),width: MediaQuery.of(context).size.width*.2,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<AccountingCard> cardList =[
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: false,cost: "12000",),
  AccountingCard(title: "همینجوری",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: true,cost: "645852",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: false,cost: "5496875",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: true,cost: "4564646864",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: false,cost: "465464879",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: true,cost: "846489788",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: false,cost: "684687978",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: true,cost: "21654546",),
  AccountingCard(title: "چمن",date: PersianDate.now().toString(showTime: false,showDate: true),isSalary: false,cost: "4654648798",),
];