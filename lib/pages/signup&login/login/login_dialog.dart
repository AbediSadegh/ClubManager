import 'package:club_manager/LoginData.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/mainPage.dart';
import 'package:club_manager/pages/signup&login/login/timer.dart';
import 'package:club_manager/pages/signup&login/register/start.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog>
    with TickerProviderStateMixin {
  GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();
  GlobalKey<FormState> smsNumberKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool click;
  final Color gradientEnd = Color(0xff676bc2);
  bool isEnabaledPhoneNumber = true;
  bool isEnableSmsNumber = false;
  AnimationController controller;
  Animation<double> animation;
  bool isLoading;
  String phone;
  SendPhoneEntity sendCodEntity;
  SendCodEntity codEntity;

  @override
  void initState() {
    super.initState();
    click = false;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    //controller.forward();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  width: 900,
                  //height: 600,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, int index) {
                        if (index == 0) {
                          return Column(
                            children: <Widget>[
                              Stack(
                                alignment: Alignment(
                                    MediaQuery.of(context).size.width / 2, 3),
                                children: <Widget>[
                                  //    child:
                                  Container(
                                    height: 175,
                                    color: gradientEnd,
                                  ),
                                  //),
                                  Container(
                                    height: 120,
                                    decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: Colors.white))),
                                    child: Container(
                                      height: 100,
                                      //child: Image(image: NetworkImage("https://png.pngtree.com/svg/20161113/ef1b24279e.png")),
                                      decoration: ShapeDecoration(
                                          shape: CircleBorder(
                                              side: BorderSide(
                                                  color: Colors.white)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://png.pngtree.com/svg/20161113/ef1b24279e.png"))),
                                      margin: EdgeInsets.all(5),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .1,
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Form(
                                      key: phoneNumberKey,
                                      child: TextFormField(
                                        onSaved: phoneNumberOnSave,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        enabled: isEnabaledPhoneNumber,
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(color: Colors.grey),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey)),
                                            icon: Icon(Icons.phone,color: Colors.grey,),
                                            labelText: "تلفن"),
                                        validator: (String str) {
                                          if (str.length < 10) {
                                            return "شماره اشتباه است";
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  isEnabaledPhoneNumber == true
                                      ? Container(
                                          height: 0,
                                        )
                                      : Opacity(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Form(
                                              key: smsNumberKey,
                                              child: TextFormField(
                                                onSaved: smsNumberOnSave,
                                                decoration: InputDecoration(
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                                  labelText: "تاییدیه پیامکی",
                                                  icon: Icon(Icons.sms,color: Colors.grey,),
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validator: (String str) {
                                                  if (str.length != 4) {
                                                    return "کد اشتباه است";
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          opacity: animation.value,
                                        ),
                                ],
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () async {
                                  //نیازمند مدیریت بعد از صفحه sms verfication
                                  if (!isEnabaledPhoneNumber &&
                                      smsNumberKey.currentState.validate()) {
                                    smsNumberKey.currentState.save();
                                  } else
                                    setState(() {
                                      getPhone();
                                    });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                    child: isLoading
                                        ? Center(
                                            child: FittedBox(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : Text("ورود"),
                                  ),
                                ),
                                color: gradientEnd,
                                textColor: Colors.white,
                              ),
                              isEnabaledPhoneNumber
                                  ? Container(
                                      height: 0,
                                    )
                                  : GestureDetector(
                                      child: Text("تغییر دادن شماره تلفن"),
                                      onTap: () {
                                        setState(() async {
                                          await controller.reverse();
                                          isEnabaledPhoneNumber = true;
                                          isEnableSmsNumber = false;
                                        });
                                      },
                                    ),
                              isEnabaledPhoneNumber
                                  ? Container(
                                      height: 0,
                                    )
                                  : ResendCode(ontap: () {
                                      print("code will resend");
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("کد مجددا فرستاده شد"),
                                        duration: Duration(seconds: 2),
                                      ));
                                    }),
                            ],
                          );
                        }
                      })),
            );
          }),
    );
  }

  sendPhone({String phone}) async {
    isLoading = true;
    click = true;
    sendCodEntity = await sendCode(mobile: phone, url: URL.sendPhone);
    setState(() {
      isLoading = false;
    });
    key.currentState.showSnackBar(SnackBar(
      content: Text("پیام شما با موفقیت ارسال شد"),
    ));
    click = false;
    await controller.forward();
    isEnableSmsNumber = true;
    isEnabaledPhoneNumber = false;
  }

  int phoneNumber;

  phoneNumberOnSave(String str) {
    phoneNumber = int.parse(str);
    print(str);
    this.phone = str;
    if (!click) sendPhone(phone: str);
  }

  int sms;

  smsNumberOnSave(String str) {
    sms = int.parse(str);
    if (!click) checkCod(code: str);
  }

  void getPhone() async {
    if (isEnabaledPhoneNumber &&
        phoneNumberKey.currentState.validate() &&
        !isEnableSmsNumber) {
      phoneNumberKey.currentState.save();
    } else if (!isEnableSmsNumber) {
      isEnabaledPhoneNumber = true;
    }
  }

  checkCod({String code}) async {
    setState(() {
      isLoading = true;
    });
    click = true;
    codEntity = await checkCode(mobile: phone, code: code, url: URL.sendCod);
    setState(() {
      isLoading = false;
    });
    if (null == codEntity) {
      key.currentState.showSnackBar(SnackBar(
        content: Text("کد نادرست است "),
      ));
    } else if (codEntity.is_registered == true) {
      _saveToekn(codEntity.token);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } else if (codEntity.is_registered == false) {
      LoginData.username = phone;
      URL.token = codEntity.token;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Start(),
        ),
      );
    }
    click = false;
  }

  _saveToekn(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
