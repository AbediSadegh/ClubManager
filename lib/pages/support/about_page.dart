import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/support/form.dart';
import 'package:club_manager/widgets/new_list_tile.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static final keys = GlobalKey<FormState>();
  bool first;
  bool isLoading;
  SocailListEntity socialListEntity;
  String name;
  bool sendCommentLoading;
  String family;
  String des;

  @override
  void initState() {
    first = true;
    isLoading = true;
    sendCommentLoading = false;
    super.initState();
  }

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  getSocial({String page: URL.urlSocail}) async {
    isLoading = true;
    socialListEntity = await loadSocail(page);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * .485;
    final containerWidth = MediaQuery.of(context).size.width;
    if (first) {
      first = false;
      getSocial();
    }
    Widget rowBuilder(IconData icon, String title, String desc) {
      return Container(
        alignment: Alignment.center,
        height: containerHeight * .18,
        width: containerWidth * .5,
        child: ListTile(
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text(
            title,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
          subtitle: FittedBox(
            child: Text(
              desc,
              style: TextStyle(fontSize: 11.0, color: Colors.white),
            ),
          ),
          leading: Icon(
            icon,
            size: 15.0,
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      key: key,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        color: Theme.of(context).primaryColor,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: containerHeight * .2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (Navigator.canPop(context)) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "پشتیبانی",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: containerHeight * .4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(FakeData.logo))),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    rowBuilder(
                                        FakeData.components[0].iconData,
                                        FakeData.components[0].title,
                                        socialListEntity.results[0].phone),
                                    rowBuilder(
                                        FakeData.components[1].iconData,
                                        FakeData.components[1].title,
                                        socialListEntity.results[0].instagram)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    rowBuilder(
                                        FakeData.components[2].iconData,
                                        FakeData.components[2].title,
                                        socialListEntity.results[0].telegram),
                                    rowBuilder(
                                        FakeData.components[3].iconData,
                                        FakeData.components[3].title,
                                        socialListEntity.results[0].email)
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
                          keys.currentState.save();
                          if (!sendCommentLoading) {
                            this.sendComment();
                          }
//                          keys.currentState.reset();
//                          key.currentState.showSnackBar(SnackBar(
//                            content: Text("پیام شما با موفقیت ارسال شد"),
//                          ));
                        }
                      },
                      child: sendCommentLoading
                          ? Center(
                              child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: CircularProgressIndicator()),
                            )
                          : Text(
                              "ارسال پیام",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
    );
    // );
  }

  namedOnSave(String str) {
    name = str;
  }

  familyOnSave(String str) {
    family = str;
  }

  descriptionOnSave(String str) {
    des = str;
  }

  sendComment() async {
    setState(() {
      sendCommentLoading = true;
    });
    SendCommentEntity sendCommentEntity = await postComment(
        name: name, content: des, family: family, url: URL.sendComment);

    setState(() {
      sendCommentLoading = false;
      if (sendCommentEntity.success == "true") {
        keys.currentState.reset();
        key.currentState.showSnackBar(SnackBar(
          content: Text("پیام شما با موفقیت ارسال شد"),
        ));
      }
    });
  }
}
