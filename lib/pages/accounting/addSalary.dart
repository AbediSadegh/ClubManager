import 'package:club_manager/pages/accounting/accountin_card.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';

class Salary extends StatelessWidget {
  final bool isSalary;
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Salary({@required this.isSalary});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: ShapeDecoration(color: Colors.blueGrey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        height: MediaQuery.of(context).size.height *.36,
        width: 500,
        child: ListView(
          children: <Widget>[
            Form(
              key: globalKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.title,
                      label: "موضوع",
                      keyType: TextInputType.text,
                      onSaved: titleOnSaved,
                      valid: (String str) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.credit_card,
                      label: "هزینه",
                      onSaved: costOnSaved,
                      keyType: TextInputType.number,
                      valid: (String str) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("تایید",style: TextStyle(color: Colors.white),),
                    color: Colors.grey,
                    onPressed: () {
                      if (globalKey.currentState.validate()) {
                        globalKey.currentState.save();
                        cardList.add(AccountingCard(
                          cost: cost,
                          time: DateTime.now().toIso8601String(),
                          isSalary: isSalary,
                          date: "1398/01/01",
                          title: title,
                        )

                        );
                        Navigator.of(context).pop();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String title;
  String cost;

  titleOnSaved(String str) {
    title = str;
  }

  costOnSaved(String str) {
    cost = str;
  }
}
