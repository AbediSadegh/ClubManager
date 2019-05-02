import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:club_manager/pages/signup&login/register/notice/notice_form.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  final PageController controller;
  final Color gradientEnd = Color(0xff676bc2);
  GlobalKey<FormState> formKey;
  final press;
  bool isLoading;
  CheckRegentCode entity;

  NoticePage({this.controller, this.press, this.formKey, this.isLoading});
  checkRegent({String page: URL.checkRegentCode,String userName}) async {
    entity = await checkRegentCode(url: page, userName: userName);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "تذکرات",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                NoticeForm(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: 130,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: press,
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                "تایید موارد فوق",
                                style: TextStyle(
                                  color: gradientEnd,
                                ),
                              )),
                  ),
                ),
                Form(
                  key: formKey,
                  child: FormTextField(
                    onSaved: reagentCodeOnSaved,
                    icon: Icons.email,
                    valid: (String str) {
                      if(str!="" && str!=null){
                        checkRegent(userName: str);
                        if(entity.success == false){
                          return "کد معرف اشتباه است";
                        }
                      }
//                      if (str!="09196675357"){
//                        return "کد معرف نا درست است ";
//                      }
                    },
                    isEnable: true,
                    keyType: TextInputType.number,
                    obsecure: false,
                    label: "کد معرف",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String reagentCode = "";

  reagentCodeOnSaved(String str) {
    reagentCode = str;
  }
}
