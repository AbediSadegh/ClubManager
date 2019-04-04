import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/add_demand_profile.dart';
import 'package:club_manager/pages/accounting/demand_note.dart';
import 'package:club_manager/pages/accounting/pass_dialog.dart';
import 'package:flutter/material.dart';

class DemandNoteView extends StatefulWidget {
  final int playerIndex;

  DemandNoteView({this.playerIndex});

  @override
  _DemandNoteViewState createState() => _DemandNoteViewState();
}

class _DemandNoteViewState extends State<DemandNoteView> {
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
                          players[widget.playerIndex].demandNote.add(
                                DemandNote(
                                    demandNoteValue: moeny,
                                    isPass: false,
                                    demandNoteAuthor: name,
                                    demandNoteDate: controller.text,
                                    demandNumber: demandNumber),
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
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "چک ها",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: players[widget.playerIndex].demandNote.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () {
                  if (players[widget.playerIndex].demandNote[index].isPass ==
                      false) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PassDialog(
                            cancelPress: () {
                              Navigator.pop(context);
                            },
                            yesPress: () {
                              setState(() {
                                players[widget.playerIndex]
                                    .demandNote[index]
                                    .isPass = true;
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
                                  .demandNote[index]
                                  .demandNoteAuthor),
                              Text("نام نویسنده چک")),
                          createRow(
                              Text(players[widget.playerIndex]
                                  .demandNote[index]
                                  .demandNoteDate),
                              Text("تاریخ")),
                          createRow(
                              players[widget.playerIndex]
                                      .demandNote[index]
                                      .isPass
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
                                  .demandNote[index]
                                  .demandNoteValue
                                  .toString()),
                              Text("مبلغ")),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
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
}
