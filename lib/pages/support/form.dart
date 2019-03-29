import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
class CommentForm extends StatelessWidget {
  final formKey;
  final nameOnSaved;
  final descriptionOnSaved;
  final familyOnSaved;



  CommentForm(
      {@required this.formKey,
        @required this.nameOnSaved,
        @required this.descriptionOnSaved,
        @required this.familyOnSaved,});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "اسم"),
              onSaved: nameOnSaved,
              validator: (String str){
                if(str.length < 2){
                  return "نام صحیح وارد کنید";
                }
              },
              keyboardType: TextInputType.text,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "فامیل"),
              onSaved: familyOnSaved,
              validator: (String str){
                if(str.length < 2){
                  return "فامیل صحیح وارد کنید";
                }
              },
              keyboardType: TextInputType.text,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "توضیحات",),
              onSaved: descriptionOnSaved,
              validator: (String str){
                if(str.length < 2){
                  return "تعداد کاراکتر غیرصحیح";
                }
              },
              keyboardType: TextInputType.text,

            ),
          ),
        ],
      ),
    );
  }
}
