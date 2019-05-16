import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/accounting/student/general_paymnet_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  final String userName;

  Profile({this.userName});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading;
  ProfileEntity profileEntity;
  bool first;

  @override
  void initState() {
    isLoading = true;
    first = true;
    super.initState();
  }

  getProfile() async {
    isLoading = true;
    profileEntity =
        await getProfileData(url: URL.profile, userName: widget.userName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getProfile();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "پروفایل",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //backgroundColor: Color(0xff676bc2),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: FittedBox(
                                      child: Text(
                                        profileEntity.user.first_name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * .40,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(profileEntity.user.last_name,
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .35,
                              width: MediaQuery.of(context).size.width * .4,
                            )
                          ],
                        ),
                      ),
                    ),
                    createContainerField(
                        context,
                        Text(
                          "پست مورد علاقه",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          profileEntity.position,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Colors.purple),
                    GestureDetector(
                      onTap: () {
                        launchURL(profileEntity.dad_phone);
                      },
                      child: createContainerField(
                          context,
                          Text(
                            "شماره تلفن پدر",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            profileEntity.dad_phone,
                            style: TextStyle(color: Colors.white),
                          ),
                          Colors.green),
                    ),
                    GestureDetector(
                onTap: () {
                  String urlLuncher =
                      profileEntity.home_phone;
                  launchURL(urlLuncher);
                },
                child: createContainerField(
                    context,
                    Text(
                      "شماره تلفن خونه",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      profileEntity.home_phone,
                      style: TextStyle(color: Colors.white),
                    ),
                    Colors.red),
              ),
                    GestureDetector(
                      onTap: () {
                        launchURL(profileEntity.mom_phone);
                      },
                      child: createContainerField(
                          context,
                          Text(
                            "شماره تلفن مادر",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            profileEntity.mom_phone,
                            style: TextStyle(color: Colors.white),
                          ),
                          Colors.blueAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        child: Container(
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width * .38,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "وضعیت مالی",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.assignment,
                                  color: Colors.white,
                                )
                              ],
                            )),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return GeneralpaymentView(
                              userName: widget.userName,
                            );
                          }));
                        },
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

Widget createTextRow(Text text1, Text text2) {
  return Row(
    children: <Widget>[
      text1,
      text2,
    ],
  );
}

Widget createContainerField(context, Text text1, Text text2, Color color) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width * .95,
      height: MediaQuery.of(context).size.height * .09,
      decoration: ShapeDecoration(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[text1, text2],
        ),
      ),
    ),
  );
}

launchURL(String phoneNumber) async {
  String url = "tel:" + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
