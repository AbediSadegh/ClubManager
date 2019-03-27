import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class createSignUpForm extends StatelessWidget {
  final formKey;
  final emailOnSaved;
  final nameOnSaved;
  final familyNameOnSaved;
  final birthDayOnSaved;
  final idNumberOnSaved;

  createSignUpForm(
      {@required this.formKey,
      @required this.emailOnSaved,
      @required this.nameOnSaved,
      @required this.familyNameOnSaved,
      @required this.birthDayOnSaved,
      @required this.idNumberOnSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
              child: FormTextField(
                label: "اسم",
                onSaved: nameOnSaved,
                obsecure: false,
                icon: Icons.person,
                isEnable: true,
                hintText: null,
                fontSize: 12,
                keyType: TextInputType.text,
                valid: (String str) {
                  if (str.length < 2) {
                    return "تعداد کاراکتر غیر مجاز";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
              child: FormTextField(
                onSaved: familyNameOnSaved,
                keyType: TextInputType.text,
                fontSize: 12,
                label: "نام خانوادگی",
                valid: (String str) {
                  if (str.length < 2) {
                    return "تعداد کاراکتر غیر مجاز";
                  }
                },
                icon: Icons.supervised_user_circle,
                obsecure: false,
                isEnable: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
              child: FormTextField(
                maxlenght: 2,
                onSaved: birthDayOnSaved,
                obsecure: false,
                isEnable: true,
                icon: Icons.assignment,
                valid: (String str) {
                  if (str.length != 2)
                    return "تعداد کاراکتر ورودی باید دو کاراکتر باشد";
                },
                label: "سال تولد",
                fontSize: 12,
                keyType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
              child: FormTextField(
                onSaved: idNumberOnSaved,
                keyType: TextInputType.number,
                fontSize: 12,
                label: "شماره شناسنامه",
                valid: (String str) {
                  if (str.length < 1) {
                    return "شماره شناسنامه اشتباه است";
                  }
                },
                icon: Icons.format_list_numbered_rtl,
                isEnable: true,
                obsecure: false,
                maxlenght: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
              child: FormTextField(
                onSaved: emailOnSaved,
                obsecure: false,
                label: "ایمیل",
                icon: Icons.alternate_email,
                isEnable: true,
                keyType: TextInputType.emailAddress,
                valid: (String str) {
                  if (str == null) {
                    return "لطفا ایمیل خود را وارد کنید";
                  } else if (!EmailValidator.validate(str)) {
                    return "ایمیل خود را به صورت صحیح وارد کنید";
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
