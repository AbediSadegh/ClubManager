import 'package:club_manager/pages/signup&login/register/health/health_form.dart';
import 'package:flutter/material.dart';

class healthPage extends StatelessWidget {
  final Color gradientEnd = Color(0xff676bc2);

  final PageController controller;
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  healthPage({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
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
                      "وضعیت جسمانی",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  healthForm(
                    formKey: formKey,
                    patientHistory: patientHistory,
                    favoritePos: favoritePos,
                    technicalFootOnSaved: technicalFootOnSaved,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
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
      ),
      onWillPop: (){
        controller.previousPage(duration: Duration(milliseconds: 1200), curve: Curves.linear);
      },
    );
  }
  technicalFootOnSaved(String str){print(str);}
  favoritePos(String str){print(str);}
  patientHistory(String str){print(str);}
}

