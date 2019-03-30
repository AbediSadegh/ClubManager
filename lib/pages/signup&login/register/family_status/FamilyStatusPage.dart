import 'package:club_manager/pages/signup&login/register/family_status/FamilyStatusForm.dart';
import 'package:flutter/material.dart';


class FamilyStatusPage extends StatelessWidget {
  final Color gradientEnd = Color(0xff676bc2);

  final PageController controller;
  static GlobalKey<FormState> familyFormKey = GlobalKey<FormState>();
  int fatherPhone;
  String fatherWorks;
  int motherPhone;
  int homePhone;
  String address;

  fatherPhoneNumber(String str) {
    print("fatherPhoneNumber : " + str);
    fatherPhone = int.parse(str);
  }

  fatherWork(String str) {
    print("fatherWork : " + str);
    fatherWorks= str;
  }

  motherPhoneNumber(String str) {
    print("motherPhoneNumber : " + str);
    motherPhone = int.parse(str);
  }

  homePhoneNumber(String str) {
    print("homePhoneNumber : " + str);
    homePhone = int.parse(str);
  }

  homeAddress(String str) {
    print("homeAddress : " + str);
    address = str;
  }

  FamilyStatusPage({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
//        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            stops: [0.5, 1],
//            colors: [
//              Colors.black.withOpacity(.8),
//              Colors.grey,
//            ],
//          ),
//        ),
        color: gradientEnd,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 55.0),
                    child: Text(
                      "وضعیت خانوادگی",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  FamilyStatusForm(
                    formKey: familyFormKey,
                    fatherPhoneNumber: fatherWork,
                    fatherWork: fatherWork,
                    homeAddress: homeAddress,
                    homePhoneNumber: homePhoneNumber,
                    motherPhoneNumber: motherPhoneNumber,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: () {
                          if (familyFormKey.currentState.validate()) {
                              familyFormKey.currentState.save();
                              familyFormKey.currentState.dispose();
                              controller.nextPage(
                                duration: Duration(milliseconds: 1400),
                                curve: Curves.linear);
                          }
                        },
                        child: Text(
                          "تایید",
                          style: TextStyle(color: gradientEnd,fontSize: 16),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onWillPop: (){
        controller.previousPage(duration: Duration(milliseconds: 1200), curve: Curves.linear);
      },
    );
  }
}
