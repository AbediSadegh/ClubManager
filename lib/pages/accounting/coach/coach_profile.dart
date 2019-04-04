import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/accounting/coach/month_widget.dart';
import 'package:club_manager/pages/accounting/coach/new_coach_profile.dart';
import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
  home: Scaffold(
    body: NewCoachProfile(),
  ),
));

class CoachProfile extends StatelessWidget {
  final index;

  CoachProfile({this.index});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .30,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: NetworkImage(coaches[index].pictureUrl),
                    ),
                  ),
                  //coaches[index].familyName
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width *.45,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(coaches[index].name ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *.45,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(coaches[index].familyName),
                        ),
                      ),
                      FittedBox(child: Text(coaches[index].birthDayYear.toString(),style: TextStyle(fontSize: 25),)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.green,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonMonth(
                    title: "فروردین",
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Bachalpsee_reflection.jpg/250px-Bachalpsee_reflection.jpg",
                    startGradientColor: Color(0xff5C258D),
                    endGradientColor: Color(0xff4389A2),
                    onTap: (){},
                  ),
                  ButtonMonth(
                    title: "اردیبهشت",
                    onTap: (){},
                    startGradientColor: Color(0xff1F1C2C),
                    endGradientColor: Color(0xff928DAB),
                    imageUrl: "http://www.unitedworldproject.org/wp-content/uploads/2016/07/images_news_2016_nature.jpg",
                  ),
                  ButtonMonth(
                    title: "خرداد",
                    imageUrl: "http://pixdaus.com/files/items/pics/3/45/149345_f7a86c2fd5c57b5d9c7a92ac0711643e_large.jpg",
                    startGradientColor: Color(0xff16222A),
                    endGradientColor: Color(0xff3A6073),
                    onTap: (){},
                  ),
                ],
              ),
            ),
            Divider(color: Colors.green,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonMonth(
                    title: "تیر",
                    imageUrl: "http://moocnewsandreviews.com/wp-content/uploads/2013/05/Summer-of-the-MOOC-2.jpg",
                    onTap: (){},
                    startGradientColor: Color(0xff5C258D),
                    endGradientColor: Color(0xff4389A2),
                  ),
                  ButtonMonth(
                    title: "مرداد",
                    imageUrl: "https://images.kojaro.com/2016/12/570fd57f-2084-4218-a9ae-f536f4811a82.jpg",
                    onTap: (){},
                    startGradientColor: Color(0xff5C258D),
                    endGradientColor: Color(0xff4389A2),
                  ),
                  ButtonMonth(
                    imageUrl: "https://odis.homeaway.com/odis/destination/4bca8936-1bdd-4831-a9a6-d937268ce00c.hw1.jpg",
                    title: "شهریور",
                    onTap: (){},
                    startGradientColor: Color(0xff5C258D),
                    endGradientColor: Color(0xff4389A2),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.green,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonMonth(
                    imageUrl: "https://cdn.britannica.com/s:300x300/88/137188-004-A05832DA.jpg",
                    startGradientColor: Color(0xff16222A),
                    endGradientColor: Color(0xff3A6073),
                    onTap: (){},
                    title: "مهر",
                  ),
                  ButtonMonth(
                    imageUrl: "https://www.abc.net.au/news/image/7747570-3x2-940x627.jpg",
                    title: "آبان",
                    onTap: (){},
                    startGradientColor: Color(0xff16222A),
                    endGradientColor: Color(0xff3A6073),
                  ),
                  ButtonMonth(
                    title: "آذر",
                    onTap: (){},
                    imageUrl: "https://newengland.com/wp-content/uploads/northeast-kingdom-vt-mitchell-720x480-1.jpg",
                    startGradientColor: Color(0xff16222A),
                    endGradientColor: Color(0xff3A6073),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.green,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonMonth(
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8A7CY1fwM1MPY2kzx9qGmd5u3ch7a6_YOexmIgyh-EPsOXNJLpA",
                    onTap: (){},
                    title: "دی",
                    startGradientColor: Color(0xff1F1C2C),
                    endGradientColor: Color(0xff928DAB),
                  ),
                  ButtonMonth(
                    onTap: (){},
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/7/72/Snow_Scene_at_Shipka_Pass_1.JPG",
                    title: "بهمن",
                    startGradientColor: Color(0xff1F1C2C),
                    endGradientColor: Color(0xff928DAB),
                  ),
                  ButtonMonth(
                    imageUrl: "https://www.bavaria.by/wp-content/uploads/2016/12/almenerleben-almhuette-winter-bayern-1200x565.jpg",
                    title: "اسفند",
                    onTap: (){},
                    startGradientColor: Color(0xff1F1C2C),
                    endGradientColor: Color(0xff928DAB),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
