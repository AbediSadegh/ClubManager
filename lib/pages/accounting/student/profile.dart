import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/student/demand_note_view.dart';
import 'package:club_manager/pages/accounting/online_pay_list/payment_list.dart';
import 'package:club_manager/pages/accounting/student/general_paymnet_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      home: Profile(
        index: 0,
      ),
    ));

class Profile extends StatelessWidget {
  final index;

  Profile({this.index});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,title: Text("پروفایل",style: TextStyle(color: Colors.black),),centerTitle: true,),
        //backgroundColor: Color(0xff676bc2),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
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
                                height: MediaQuery.of(context).size.height * .12,
                                width: MediaQuery.of(context).size.width * .5,
                                child: FittedBox(
                                  child: Text(
                                    players[index].name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .12,
                                width: MediaQuery.of(context).size.width *.40,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(players[index].family,
                                      style: TextStyle(
                                          color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width*.4,
                          child: Image(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "https://images2.minutemediacdn.com/image/upload/c_fill,w_912,h_516,f_auto,q_auto,g_auto/shape/cover/sport/fc-bayern-muenchen-v-vfb-stuttgart-bundesliga-5c6171549eef2db581000001.jpg"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                createContainerField(
                    context,
                    index,
                    Text(
                      "پست مورد علاقه",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      players[index].favoritePos,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Colors.purple),
                GestureDetector(
                  onTap: () {
                    launchURL(players[index].fatherPhone.toString());
                  },
                  child: createContainerField(
                      context,
                      index,
                      Text(
                        "شماره تلفن پدر",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        players[index].fatherPhone.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Colors.green),
                ),
                GestureDetector(
                  onTap: () {
                    String urlLuncher = players[index].homePhone.toString();
                    launchURL(urlLuncher);
                  },
                  child: createContainerField(
                      context,
                      index,
                      Text(
                        "شماره تلفن خونه",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        players[index].homePhone.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Colors.red),
                ),
                GestureDetector(
                  onTap: () {
                    launchURL(players[index].motherPhone.toString());
                  },
                  child: createContainerField(
                      context,
                      index,
                      Text(
                        "شماره تلفن مادر",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        players[index].motherPhone.toString(),
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
                        return GeneralpaymentView(playerIndex: index,);
//                              OnlinePaymentList(
//                              playerIndex: index,
//                            );
                      }));
                    },
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
//            Container(
//              child: DemandNoteView(
//                playerIndex: index,
//              ),
//              height: 500,
//            )
              ],
            ),
          ],
        ),
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

Widget createContainerField(
    context, index, Text text1, Text text2, Color color) {
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
