import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/support/updateTextField.dart';
import 'package:flutter/material.dart';

class UpdateAbout extends StatelessWidget {
  static GlobalKey<FormState> updateDialogKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),color: Colors.grey),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("آپدیت اطلاعات تماس با ما",style: TextStyle(color: Colors.black,fontSize: 18),)),
            ),
            Form(
              key: updateDialogKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(8),child: UpdateField(
                    onSaved: phone,
                    initialValue: FakeData.components[0].title,
                    validator: (String str) {
                      if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                    },
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: phoneNumber,
                      initialValue: FakeData.components[0].subtitle,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: instagram,
                      initialValue: FakeData.components[1].title,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: instagramId,
                      initialValue: FakeData.components[1].subtitle,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: email,
                      initialValue: FakeData.components[2].title,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: emailAddress,
                      initialValue: FakeData.components[2].subtitle,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: telegram,
                      initialValue: FakeData.components[3].title,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UpdateField(
                      onSaved: telegramId,
                      initialValue: FakeData.components[3].subtitle,
                      validator: (String str) {
                        if (str.length < 2) return "تعداد کاراکتر صحیح وارد کنبد";
                      },
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.black26,
              child: Text("آپدیت"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                if(updateDialogKey.currentState.validate()){
                  updateDialogKey.currentState.save();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  phone(String str){FakeData.components[0].title = str;}
  phoneNumber(String str){FakeData.components[0].subtitle = str;}
  instagram(String str){FakeData.components[1].title = str;}
  instagramId(String str){FakeData.components[1].subtitle = str;}
  email(String str){FakeData.components[2].title = str;}
  emailAddress(String str){FakeData.components[2].subtitle = str;}
  telegram(String str){FakeData.components[3].title = str;}
  telegramId(String str){FakeData.components[3].subtitle = str;}
}


