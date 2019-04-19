import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/accounting/student/add_demand_profile.dart';
import 'package:club_manager/pages/accounting/student/demand_note.dart';
import 'package:club_manager/pages/accounting/student/new_pay_list.dart';
import 'package:club_manager/pages/accounting/online_pay_list/online_payment_card.dart';
import 'package:club_manager/pages/accounting/student/pass_dialog.dart';
import 'package:club_manager/pages/signup&login/player.dart';
import 'package:flutter/material.dart';

class GeneralpaymentView extends StatefulWidget {
  final String userName;

  GeneralpaymentView({this.userName});

  @override
  _GeneralpaymentViewState createState() => _GeneralpaymentViewState();
}

class _GeneralpaymentViewState extends State<GeneralpaymentView> {
  final TextEditingController controller = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading;
  bool first;
  ExerciseUserListEntity entity;
  CheckCreateEntity createEntity;
  bool isLoadingDialog;
  CheckPassEntity checkPassEntity;
  bool dialogLoadingPassCheck;

  @override
  void initState() {
    isLoadingDialog = false;
    isLoading = true;
    first = true;
    dialogLoadingPassCheck = false;
    super.initState();
  }

  getUserPayment({String page: URL.commerceUser}) async {
    isLoading = true;
    entity = await getPayment(url: page, userName: widget.userName);
    setState(() {
      isLoading = false;
    });
  }

  createCheckUser(
      {String page: URL.createCheck,
      String price,
      String name,
      String date,
      String number}) async {
    setState(() {
      isLoadingDialog = true;
    });
    createEntity = await createCheck(
        url: page,
        date: date,
        userName: widget.userName,
        price: price,
        name: name,
        number: number);
    Navigator.of(context).pop();
    setState(() {
      isLoadingDialog = false;
      first = true;
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getUserPayment();
    }
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
                    isLoading: isLoadingDialog,
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
                          if (!isLoadingDialog)
                            createCheckUser(
                                date: controller.text,
                                price: moeny.toString(),
                                name: nameHaveCheck,
                                number: demandNumber);
                        }
                      });
                    },
                  );
                });
          },
          icon: Icon(Icons.assessment),
          label: Text(
            "اضافه کردن چک",
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
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: entity.checks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PassDialog(isLoading: isLoadingDialog,
                              cancelPress: () {
                                Navigator.pop(context);
                              },
                              yesPress: () {
                                passCheck(id: entity.checks[index].id.toString());
                              },
                            );
                          });
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
                              createRow(Text(entity.checks[index].name),
                                  Text("نام نویسنده چک")),
                              createRow(
                                  Text(entity.checks[index].date.length == 8
                                      ? convertDate(entity.checks[index].date)
                                      : entity.checks[index].date),
                                  Text("تاریخ")),
                              createRow(
                                  entity.checks[index].is_passed
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
                                  Text(entity.checks[index].price.toString()),
                                  Text("مبلغ")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
//              if(players[widget.playerIndex].generalPayment[index].isDemandNote){
//                return GestureDetector(
//                  onLongPress: () {
//                    if (players[widget.playerIndex].generalPayment[index].demandNote.isPass ==
//                        false) {
//                      showDialog(
//                          context: context,
//                          builder: (context) {
//                            return PassDialog(
//                              cancelPress: () {
//                                Navigator.pop(context);
//                              },
//                              yesPress: () {
//                                String title=players[widget.playerIndex].family + " "+ "چک";
//                              cardList.add(AccountingCard(
//                                time: "",
//                                title: title,
//                                isSalary: true,
//                                cost: players[widget.playerIndex].generalPayment[index].demandNote.demandNoteValue.toString(),
//                                date: players[widget.playerIndex].generalPayment[index].demandNote.demandNoteDate,
//                              ));
//                              print(cardList.length);
//                                setState(() {
//                                  players[widget.playerIndex]
//                                      .generalPayment[index]
//                                      .demandNote.isPass = true;
//                                });
//                                Navigator.of(context).pop();
//                              },
//                            );
//                          });
//                    }
//                  },
//                  child: Card(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15)),
//                    child: Container(
//                      height: MediaQuery.of(context).size.height * .20,
//                      width: MediaQuery.of(context).size.width * .85,
//                      child: Padding(
//                        padding: const EdgeInsets.all(14.0),
//                        child: Column(
//                          children: <Widget>[
//                            createRow(
//                                Text(players[widget.playerIndex]
//                                    .generalPayment[index]
//                                    .demandNote.demandNoteAuthor),
//                                Text("نام نویسنده چک")),
//                            createRow(
//                                Text(players[widget.playerIndex]
//                                    .generalPayment[index]
//                                    .demandNote.demandNoteDate),
//                                Text("تاریخ")),
//                            createRow(
//                                players[widget.playerIndex]
//                                    .generalPayment[index]
//                                    .demandNote.isPass
//                                    ? Text(
//                                  "پاس شده",
//                                  style: TextStyle(color: Colors.green),
//                                )
//                                    : Text(
//                                  "پاس نشده",
//                                  style: TextStyle(color: Colors.red),
//                                ),
//                                Text("وضعیت")),
//                            createRow(
//                                Text(players[widget.playerIndex]
//                                    .generalPayment[index]
//                                    .demandNote
//                                    .demandNoteValue
//                                    .toString()),
//                                Text("مبلغ")),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                );
//              }
//              else return OnlinePaymentCard(index: index,playerIndex: widget.playerIndex,);
                }),
      ),
    );
  }

  String nameHaveCheck;

  nameOnSaved(String str) {
    nameHaveCheck = str;
  }

  String demandNumber;

  demandNumberOnSaved(String str) {
    demandNumber = str;
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

  String convertDate(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(4, 6);
    String day = date.substring(6, 8);
    return year + "/" + month + "/" + day;
  }

  passCheck({String page: URL.checkPass, String id}) async {
    setState(() {
      dialogLoadingPassCheck = true;
    });
    checkPassEntity = await passedCheck(url: page, id: id);
    setState(() {
      Navigator.pop(context);
      dialogLoadingPassCheck = false;
      first = true;
    });
  }
}
