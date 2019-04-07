import 'package:club_manager/pages/accounting/student/player_list.dart';
import 'package:flutter/material.dart';

class Alephabetic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(colors: <Color>[
            const Color(0xff2c5364),
            const Color(0xff0f2027)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: .25,
              child: new Container(
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://previews.123rf.com/images/thingass/thingass1312/thingass131200049/24728476-a-black-and-white-background-of-english-language-newspapers-stacked-and-folded-in-a-horizontal-posit.jpg"),
                      repeat: ImageRepeat.repeat),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("ا",1,context),
                      circleAvatarN("ب",2,context),
                      circleAvatarN("پ",3,context),
                      circleAvatarN("ت",4,context),
                      circleAvatarN("ث",5,context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("ج",6,context),
                      circleAvatarN("چ",7,context),
                      circleAvatarN("ح",8,context),
                      circleAvatarN("خ",9,context),
                      circleAvatarN("د",10,context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("ذ",11,context),
                      circleAvatarN("ر",12,context),
                      circleAvatarN("ز",13,context),
                      circleAvatarN("ژ",14,context),
                      circleAvatarN("س",15,context),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("ش",16,context),
                      circleAvatarN("ص",17,context),
                      circleAvatarN("ض",18,context),
                      circleAvatarN("ط",19,context),
                      circleAvatarN("ظ",20,context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("ع",21,context),
                      circleAvatarN("غ",22,context),
                      circleAvatarN("ف",23,context),
                      circleAvatarN("ق",24,context),
                      circleAvatarN("ک",25,context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleAvatarN("گ",26,context),
                      circleAvatarN("ل",27,context),
                      circleAvatarN("م",28,context),
                      circleAvatarN("ن",29,context),
                      circleAvatarN("و",30,context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      circleAvatarN("ه",31,context),
                      circleAvatarN("ی",32,context),
                      //circleAvatarN("ی",31),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  circleAvatarN(String str,int index,BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return PlayerList(alephabetic: str,);}));
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.orange.withOpacity(.75),
        child: Text(str,style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
    );
  }

}
