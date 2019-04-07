import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';

class HealthForm extends StatelessWidget {

  final formKey;
  final technicalFootOnSaved;
  final favoritePos;
  final patientHistory;



  HealthForm(
      {@required this.formKey,
        @required this.technicalFootOnSaved,
        @required this.favoritePos,
        @required this.patientHistory,});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              onSaved: technicalFootOnSaved,
              label: "پای تخصصی",
              obsecure: false,
              isEnable: true,
              keyType: TextInputType.multiline,
              icon: Icons.work,
              valid: (String str) {
                if (str.length < 2) {
                  return "لطفا به صورت صحیح وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              onSaved: patientHistory,
              icon: Icons.assignment,
              keyType: TextInputType.text,
              isEnable: true,
              obsecure: false,
              label: "سابقه بیماری",
              valid: (String str) {

              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              onSaved: favoritePos,
              icon: Icons.accessibility,
              keyType: TextInputType.text,
              isEnable: true,
              obsecure: false,
              label: "پست مورد علاقه",
              valid: (String str) {
                if (str.length < 2) {
                  return "لطفا پست مورد علاقه خود را وارد کنید";
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
