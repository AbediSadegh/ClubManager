
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
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          // Where the linear gradient begins and ends
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter,
//          // Add one stop for each color. Stops should increase from 0 to 1
//          stops: [0.5, 1],
//          colors: [
//            // Colors are easy thanks to Flutter's Colors class.
//            Colors.black.withOpacity(.8),
//            Colors.grey,
//          ],
//        ),
//      ),
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
                cameraPicker(),
                createSignUpForm(
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
                      //Navigator.push(context, SlideRightRoute(widget: page2()));
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
  }

  nameOnSaved(String str) {
    print("name : " + str);
    name = str;
  }

  familyNameOnSaved(String str) {
    print("family : " + str);
    family = str;
  }

  birthDayOnSaved(String str) {
    print("birthDay : " + str);
    birthDay = int.parse(str);
  }

  idNumberOnSaved(String str) {
    print("idNumberOnSaved : " + str);
    id = int.parse(str);
  }

}
var email ;


