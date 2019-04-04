import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/signup&login/login/timer.dart';
import 'package:club_manager/pages/signup&login/register/start.dart';
import 'package:flutter/material.dart';

class loginDialog extends StatefulWidget {
  @override
  _loginDialogState createState() => _loginDialogState();
}

class _loginDialogState extends State<loginDialog>
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
  SendCodEntity sendCodEntity;

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
//                          alignment: Alignment(
//                              MediaQuery.of(context).size.width / 2, 2.1),
                                alignment: Alignment(
                                    MediaQuery.of(context).size.width / 2, 3),

                                children: <Widget>[
                                  //new ClipPath(
                                  //clipper: CustomShapeClipper(),
                                  //    child:
                                  Container(
                                    height: 175,
                                    //color: Colors.orange,
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
                                            icon: Icon(Icons.phone),
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
                                                  labelText: "تاییدیه پیامکی",
                                                  icon: Icon(Icons.sms),
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
                                    //await controller.forward();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return Start();
                                    }));
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
                                            child: FittedBox(child: CircularProgressIndicator()),
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
                                  : resendCode(ontap: () {
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
    sendCodEntity = await sendCode(mobile: phone, url: URL.sendCod);
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
    if (!click) sendPhone(phone: str);
  }

  int sms;

  smsNumberOnSave(String str) {
    sms = int.parse(str);
    print(sms);
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
}
