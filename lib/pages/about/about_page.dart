import 'package:club_manager/pages/about/form.dart';
import 'package:flutter/material.dart';




class AboutPage extends StatelessWidget {

  static final keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * .485;
    final containerWidth = MediaQuery.of(context).size.width;


    Widget rowBuilder(IconData icon, String title, String desc) {
      return Container(
        height: containerHeight * .18,
        width: containerWidth * .5,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 15.0,color: Colors.white),
          ),
          subtitle: Text(
            desc,
            style: TextStyle(fontSize: 11.0,color: Colors.white),
          ),
          leading: Icon(
            icon,
            size: 15.0,
            color: Colors.white,
          ),
          isThreeLine: false,
        ),
      );
    }

    GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    return  Scaffold(
      key: key,
      body: Container(
      child: ListView(

            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: containerHeight,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.5, 1],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.blueAccent,
                          Colors.blue.withOpacity(.6),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: containerHeight * .2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "تماس با ما",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(child: Icon(Icons.arrow_forward_ios,color: Colors.white,),onTap: (){Navigator.canPop(context);},),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: containerHeight * .4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/en/5/52/Padideh_Shahr-e_Khodrou_logo.png"))),
                      ),
                      Container(
//                    height: containerHeight * .4,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                rowBuilder(Icons.phone, 'تلفن', '091**********'),
                                rowBuilder(
                                    Icons.photo_camera, 'اینستاگرام', '@padidehFc')
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                rowBuilder(
                                    Icons.email, "ایمیل", "*********@gmail.com"),
                                rowBuilder(Icons.send, "تلگرام", '@shahrkhodrou_fc')
                              ],
                            )
                          ],
//                    )
                        ),
                      )
                    ],
                  ),
                ],
              ),
              CommentForm(
                formKey: keys,
                nameOnSaved: namedOnSave,
                descriptionOnSaved: descriptionOnSave,
                familyOnSaved: familyOnSave,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () {
                    if (keys.currentState.validate()) {
                      print("succrss");
                      keys.currentState.save();
                      keys.currentState.reset();
                      key.currentState.showSnackBar(SnackBar(
                        content: Text("پیام شما با موفقیت ارسال شد"),
                      ));
                    }
                  },
                  child: Text("ارسال پیام",style: TextStyle(color: Colors.white,fontSize: 15),),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.blue,
                ),
              )
            ],


      ),
    ),);
   // );
  }

  namedOnSave(String str) {
    print(str);
  }

  familyOnSave(String str) {
    print(str);
  }

  descriptionOnSave(String str) {
    print(str);
  }
}
