import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/general_information/accountin_card.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
  final bool isSalary;
  final globalKey;
  final onPress;
  final titleOnSaved;
  bool isLoading;
  final costOnSaved;
  Salary({@required this.isSalary,this.globalKey,this.onPress,this.costOnSaved,this.titleOnSaved,this.isLoading});


}

class _SalaryState extends State<Salary> {

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
              key:widget. globalKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.title,
                      label: "موضوع",
                      keyType: TextInputType.text,
                      onSaved: widget.titleOnSaved,
                      valid: (String str) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormTextField(
                      icon: Icons.credit_card,
                      label: "هزینه",
                      onSaved:widget. costOnSaved,
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
                    child: widget.isLoading ? Center(child: CircularProgressIndicator(),): Text("تایید",style: TextStyle(color: Colors.white),),
                    color: Colors.grey,
                    onPressed: widget.onPress,
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