//import 'package:club_manager/FakeEntity.dart';
//import 'package:club_manager/pages/accounting/online_pay_list/online_payment_card.dart';
//import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
//import 'package:flutter/material.dart';
//
//class OnlinePaymentList extends StatefulWidget {
//  final playerIndex;
//
//
//  OnlinePaymentList({this.playerIndex});
//
//  @override
//  _OnlinePaymentListState createState() => _OnlinePaymentListState();
//}
//
//class _OnlinePaymentListState extends State<OnlinePaymentList> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      floatingActionButton: FloatingActionButton.extended(onPressed: (){
//        showDialog(context: context,builder: (context){
//
//        });
//      }, icon: Icon(Icons.payment), label: Text("اظافه کردن")),
//      body: ListView.builder(
//          itemCount: players[widget.playerIndex].onlinePay.length,
//          itemBuilder: (context,index){
//            return OnlinePaymentCard(index: index,playerIndex: widget.playerIndex,);
//          }
//          ),
//    );
//  }
//  String date;
//  String cost;
//  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  Widget addCostDialog(final playerIndex){
//    return Dialog(
//      child: ListView(
//        children: <Widget>[
//          Form(
//            child: Column(
//              children: <Widget>[
//                FormTextField(
//                  keyType: TextInputType.text,
//                  icon: Icons.assignment,
//                  label: "تاریخ",
//                  valid: (String str){},
//                  onSaved: (String str){date =str;},
//                ),
//                FormTextField(
//                  valid: (String str){},
//                  onSaved: (String str){cost = str;},
//                  label: "هزینه",
//                  icon: Icons.credit_card,
//                  keyType: TextInputType.number,
//                ),
//
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
