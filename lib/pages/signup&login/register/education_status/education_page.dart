
import 'package:club_manager/pages/signup&login/register/education_status/education_form.dart';
import 'package:flutter/material.dart';


class EducationPage extends StatelessWidget {
  //Color gradientStart = Color(0xFFb8adfe);
  final Color gradientEnd = Color(0xff676bc2);
  final PageController controller;
  static GlobalKey<FormState> eduKey = GlobalKey<FormState>();

  EducationPage({this.controller});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.previousPage(
            duration: Duration(milliseconds: 1400), curve: Curves.linear);
      },
      child: Container(
        color: gradientEnd,
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 55.0),
                  child: Text(
                    "وضعیت تحصیلی",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                EducationForm(
                  formKey: eduKey,
                  coachName: coachNameOnSaved,
                  lastTeam: lastTeamOnSaved,
                  schoolName: schoolNameOnSaved,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      onPressed: () {
                        //Navigator.push(context, SlideRightRoute(widget: page2()));
                        if (eduKey.currentState.validate()) {
                          eduKey.currentState.save();
                          controller.nextPage(
                              duration: Duration(milliseconds: 1400),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        "تایید",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String schoolName;
  String coachName;
  String lastTeam;

  schoolNameOnSaved(String str) {
    print("schoolName : " + str);
    schoolName = str;
  }

  coachNameOnSaved(String str) {
    print("coachName : " + str);
    coachName = str;
  }

  lastTeamOnSaved(String str) {
    lastTeam = str;
    print("lastTeam : " + str);
  }
}
