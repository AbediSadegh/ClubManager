import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/support/updateTextField.dart';
import 'package:flutter/material.dart';

class updateAbout extends StatelessWidget {
  static GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: MediaQuery.of(context).size.height * .45,
        child: Column(
          children: <Widget>[
            Form(
              key: formController,
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    style: TextStyle(color: Colors.white),
                    onSaved: companyDetail,
                    initialValue: FakeData.companyDetail,
                    validator: (String str) {
                      if (str.length < 2) {
                        return "لطفا به صورت صحیح وارد کنید";
                      }
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    child: Text(
                      "آپدیت",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (formController.currentState.validate()) {
                        formController.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "انصراف",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  companyDetail(String str) {
    FakeData.companyDetail = str;
  }
}
