
import 'package:club_manager/LoginData.dart';
import 'package:club_manager/pages/signup&login/register/general_information/general_form.dart';
import 'package:club_manager/pages/signup&login/test_camera.dart';
import 'package:flutter/material.dart';


class GeneralPage extends StatelessWidget {
  final PageController controller;
  static GlobalKey<FormState> generalKeyForm = GlobalKey<FormState>();

  GeneralPage({this.controller});

  //final Color gradientStart = Color(0xFFb8adfe);
  final Color gradientEnd = Color(0xff676bc2);
  String name;
  String family;
  int birthDay;
  String email;
  int id;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: gradientEnd,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                //Container(height: MediaQuery.of(context).size.height*.2,),
                CameraPicker(),
                CreateSignUpForm(
                  formKey: generalKeyForm,
                  birthDayOnSaved: birthDayOnSaved,
                  emailOnSaved: emailOnSaved,
                  familyNameOnSaved: familyNameOnSaved,
                  idNumberOnSaved: idNumberOnSaved,
                  nameOnSaved: nameOnSaved,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    onPressed: () {
                       if (generalKeyForm.currentState.validate()) {
                        generalKeyForm.currentState.save();
                        controller.nextPage(
                            duration: Duration(milliseconds: 1400),
                            curve: Curves.linear);
                        print(email);
                      }
                    },
                    child: Text(
                      "تایید",
                      style: TextStyle(
                          color: gradientEnd, fontSize: 16,),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
  emailOnSaved(String str) {
    print("email : " + str);
    email = str;
    LoginData.email=str;
  }

  nameOnSaved(String str) {
    print("name : " + str);
    name = str;
    LoginData.name=str;

  }

  familyNameOnSaved(String str) {
    print("family : " + str);
    family = str;
    LoginData.family=str;

  }

  birthDayOnSaved(String str) {
    print("birthDay : " + str);
    birthDay = int.parse(str);
    LoginData.birthDay=str;

  }

  idNumberOnSaved(String str) {
    print("idNumberOnSaved : " + str);
    id = int.parse(str);
    LoginData.cardNumber=str;

  }

}
var email ;


