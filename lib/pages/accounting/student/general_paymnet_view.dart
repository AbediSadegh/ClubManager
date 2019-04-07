import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/accounting/student/add_demand_profile.dart';
import 'package:club_manager/pages/accounting/student/demand_note.dart';
import 'package:club_manager/pages/accounting/student/new_pay_list.dart';
import 'package:club_manager/pages/accounting/online_pay_list/online_payment_card.dart';
import 'package:club_manager/pages/accounting/student/pass_dialog.dart';
import 'package:club_manager/pages/signup&login/player.dart';
import 'package:flutter/material.dart';

class GeneralpaymentView extends StatefulWidget {
  final playerIndex;


  GeneralpaymentView({this.playerIndex});

  @override
  _GeneralpaymentViewState createState() => _GeneralpaymentViewState();
}

class _GeneralpaymentViewState extends State<GeneralpaymentView> {
  final TextEditingController controller = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {

                  return DemandNoteDialog(
                    nameOnSaved: nameOnSaved,
                    demandMoenyOnSaved: demandMoenyOnSaved,
                    demandNumberOnSaved: demandNumberOnSaved,
                    textEditingController: controller,
                    keyForm: formKey,
                    buttonPress: () {
                      setState(() {
                        if (formKey.currentState.validate() &&
                            controller.toString() != null) {
                          formKey.currentState.save();
                          players[widget.playerIndex].generalPayment.add(
                              GeneralPaymentInformation(
                                isDemandNote: true,
                                demandNote:DemandNote(
                              demandNoteValue: moeny,
                              isPass: false,
                              demandNoteAuthor: name,
                              demandNoteDate: controller.text,
                              demandNumber: demandNumber),

                              ),
                          );
                          Navigator.of(context).pop();
                        }
                      });
                    },
                  );
                });
          },
          icon: Icon(Icons.assessment),
          label: Text(
            "اظافه کردن چک",
            style: TextStyle(color: Colors.white),
          )),
      appBar: AppBar(
        title: Text(
          "لیست پرداخت ها",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: players[widget.playerIndex].generalPayment.length,
            itemBuilder: (context,index){
              if(players[widget.playerIndex].generalPayment[index].isDemandNote){
                return GestureDetector(
                  onLongPress: () {
                    if (players[widget.playerIndex].generalPayment[index].demandNote.isPass ==
                        false) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PassDialog(
                              cancelPress: () {
                                Navigator.pop(context);
                              },
                              yesPress: () {
                                String title=players[widget.playerIndex].family + " "+ "چک";
                              cardList.add(AccountingCard(
                                time: "",
                                title: title,
                                isSalary: true,
                                cost: players[widget.playerIndex].generalPayment[index].demandNote.demandNoteValue.toString(),
                                date: players[widget.playerIndex].generalPayment[index].demandNote.demandNoteDate,
                              ));
                              print(cardList.length);
                                setState(() {
                                  players[widget.playerIndex]
                                      .generalPayment[index]
                                      .demandNote.isPass = true;
                                });
                                Navigator.of(context).pop();
                              },
                            );
                          });
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .20,
                      width: MediaQuery.of(context).size.width * .85,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: <Widget>[
                            createRow(
                                Text(players[widget.playerIndex]
                                    .generalPayment[index]
                                    .demandNote.demandNoteAuthor),
                                Text("نام نویسنده چک")),
                            createRow(
                                Text(players[widget.playerIndex]
                                    .generalPayment[index]
                                    .demandNote.demandNoteDate),
                                Text("تاریخ")),
                            createRow(
                                players[widget.playerIndex]
                                    .generalPayment[index]
                                    .demandNote.isPass
                                    ? Text(
                                  "پاس شده",
                                  style: TextStyle(color: Colors.green),
                                )
                                    : Text(
                                  "پاس نشده",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text("وضعیت")),
                            createRow(
                                Text(players[widget.playerIndex]
                                    .generalPayment[index]
                                    .demandNote
                                    .demandNoteValue
                                    .toString()),
                                Text("مبلغ")),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }else return OnlinePaymentCard(index: index,playerIndex: widget.playerIndex,);
            }),
      ),
    );
  }
  String name;
  nameOnSaved(String str) {
    name = str;
  }

  int demandNumber;

  demandNumberOnSaved(String str) {
    demandNumber = int.parse(str);
  }

  int moeny;

  demandMoenyOnSaved(String str) {
    moeny = int.parse(str);
  }

  String date;

  dateOnSaved() {
    date = controller.toString();
  }

  Widget createRow(Text text1, Text text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text1,
        text2,
      ],
    );
  }
}
