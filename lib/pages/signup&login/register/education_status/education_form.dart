import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';


class EducationForm extends StatelessWidget {
  final formKey;
  final schoolName;
  final coachName;
  final lastTeam;

  EducationForm(
      {@required this.formKey,
      @required this.coachName,
      @required this.lastTeam,
      @required this.schoolName});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              icon: Icons.school,
              onSaved: schoolName,
              label: "نام مدرسه",
              obsecure: false,
              isEnable: true,
              keyType: TextInputType.text,
              valid: (String str) {
                if (str.length < 2) {
                  return "نام مدرسه خود را وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              onSaved: coachName,
              icon: Icons.person_pin,
              keyType: TextInputType.text,
              isEnable: true,
              obsecure: false,
              label: "نام دبیر ورزش",
              valid: (String name) {
                if (name.length < 2) {
                  return "نام دبیر ورزش خود را وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            child: FormTextField(
              onSaved: lastTeam,
              label: "نام باشگاه قبلی",
              obsecure: false,
              isEnable: true,
              keyType: TextInputType.text,
              icon: Icons.assignment,
            ),
          ),
        ],
      ),
    );
  }
}
