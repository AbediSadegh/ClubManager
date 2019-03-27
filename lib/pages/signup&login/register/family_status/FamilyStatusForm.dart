import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';



class FamilyStatusForm extends StatelessWidget {
  final formKey;
  final fatherPhoneNumber;
  final fatherWork;
  final motherPhoneNumber;
  final homePhoneNumber;
  final homeAddress;

  FamilyStatusForm(
      {@required this.formKey,
      @required this.fatherPhoneNumber,
      @required this.fatherWork,
      @required this.motherPhoneNumber,
      @required this.homePhoneNumber,
      @required this.homeAddress});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormTextField(
              icon: Icons.phone_android,
              keyType: TextInputType.phone,
              isEnable: true,
              obsecure: false,
              label: "شماره همراه پدر",
              onSaved: fatherPhoneNumber,
              valid: (String str) {
                if (str.length < 10) {
                  return "لطفا شماره خود را به صورت صحیح وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormTextField(
              onSaved: fatherWork,
              label: "شغل پدر",
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
            padding: const EdgeInsets.all(8.0),
            child: FormTextField(
              onSaved: motherPhoneNumber,
              icon: Icons.phone_iphone,
              keyType: TextInputType.phone,
              isEnable: true,
              obsecure: false,
              label: "شماره همراه مادر",
              valid: (String str) {
                if (str.length < 10) {
                  return "لطفا شماره خود را به صورت صحیح وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormTextField(
              onSaved: homePhoneNumber,
              label: "تلفن ثابت",
              obsecure: false,
              isEnable: true,
              keyType: TextInputType.phone,
              icon: Icons.call,
              valid: (String str) {
                if (str.length < 8) {
                  return "لطفا شماره خود را به صورت صحیح وارد کنید";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormTextField(
              onSaved: homeAddress,
              icon: Icons.home,
              keyType: TextInputType.multiline,
              isEnable: true,
              obsecure: false,
              label: "آدرس منزل",
              valid: (String str) {
                if (str.length < 2) {
                  return "لطفا آدرس صحیح وارد کنید";
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
