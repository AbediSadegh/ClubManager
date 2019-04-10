import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';

class Salary extends StatelessWidget {
  final bool isSalary;
  final globalKey;
  final onPress;
  final titleOnSaved;
  final costOnSaved;
  Salary({@required this.isSalary,this.globalKey,this.onPress,this.costOnSaved,this.titleOnSaved});

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
                    onPressed: onPress,
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


}
