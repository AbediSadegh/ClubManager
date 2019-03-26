import 'package:club_manager/pages/signup&login/player.dart';
import 'package:club_manager/pages/signup&login/register/education_status/education_page.dart';
import 'package:club_manager/pages/signup&login/register/family_status/FamilyStatusPage.dart';
import 'package:club_manager/pages/signup&login/register/general_information/general_page.dart';
import 'package:club_manager/pages/signup&login/register/health/health_page.dart';
import 'package:club_manager/pages/signup&login/register/notice/notice_page.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final PageController controller = PageController();
  GeneralPage generalPage;
  EducationPage educationPage;
  FamilyStatusPage familyStatusPage;
  healthPage health;
  NoticePage noticePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: false,
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          generalPage = GeneralPage(controller: controller),
          educationPage = EducationPage(controller: controller),
          familyStatusPage = FamilyStatusPage(
            controller: controller,
          ),
          health = healthPage(
            controller: controller,
          ),
          noticePage = NoticePage(
            controller: controller,
            press: () {
              Player play = new Player(
                address: familyStatusPage.address,
                birthday: generalPage.birthDay,
                coachName: educationPage.coachName,
                email: generalPage.email,
                family: generalPage.family,
                fatherPhone: familyStatusPage.fatherPhone,
                fatherWorks: familyStatusPage.fatherWorks,
                //favoritePos: health.favoritePos,
                homePhone: familyStatusPage.homePhone,
                lastTeam: educationPage.lastTeam,
                motherPhone: familyStatusPage.motherPhone,
                name: generalPage.name,
                passport: generalPage.id,
                //patientHistory: health.patientHistory,
                schoolName: educationPage.schoolName,
                //technicalFoot: health.technicalFoot,
              );
              Navigator.pop(context);
              print("success");
//            Scaffold.of(context).showSnackBar(SnackBar(
//              content: Text("ثبت نام موفقیت آمیز بود"),
//              duration: Duration(seconds: 5),
//            ));
            },
          ),
        ],
      ),
    );
  }
}
