import 'package:club_manager/pages/accounting/student/demand_note.dart';
import 'package:club_manager/pages/accounting/student/pass_dialog.dart';
import 'package:flutter/material.dart';

class DemandNoteInformation extends StatefulWidget {
  @override
  _DemandNoteInformationState createState() => _DemandNoteInformationState();
}

class _DemandNoteInformationState extends State<DemandNoteInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: note.length,
          itemBuilder: (context , index){
            return GestureDetector(
              onLongPress: (){
                if(note[index].isPass ==false ) {
                showDialog(context: context,builder: (context){ return PassDialog(
                  yesPress: (){setState(() {
                    note[index].isPass = true;
                    Navigator.pop(context);
                  });},
                  cancelPress:(){Navigator.pop(context);},

                );});
                }
              },
              child:  Card(
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
                            Text(note[index].demandNoteAuthor),
                            Text("نام نویسنده چک")),
                        createRow(
                            Text(note[index].demandNoteDate),
                            Text("تاریخ")),
                        createRow(
                            note[index].isPass
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
                            Text(note[index].demandNoteValue.toString()),
                            Text("مبلغ")),
                      ],
                    ),
                  ),
                ),
              ),
            );

          }),
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
}
List<DemandNote> note=[
  DemandNote(demandNoteValue: 15000,isPass: false,demandNoteAuthor: "amirHossein",demandNoteDate: "98/01/22",demandNumber: 123456),
  DemandNote(demandNoteValue: 25000,isPass: false,demandNoteAuthor: "hamed",demandNoteDate: "98/01/23",demandNumber: 123456),
  DemandNote(demandNoteValue: 35000,isPass: false,demandNoteAuthor: "hossein",demandNoteDate: "98/01/24",demandNumber: 12155555),
  DemandNote(demandNoteValue: 45000,isPass: false,demandNoteAuthor: "sadegh",demandNoteDate: "98/01/25",demandNumber: 156464),
];