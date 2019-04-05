import 'package:club_manager/pages/signup&login/player.dart';
import 'package:club_manager/pages/signup&login/register/education_status/education_page.dart';
import 'package:club_manager/pages/signup&login/register/family_status/FamilyStatusPage.dart';
import 'package:club_manager/pages/signup&login/register/general_information/general_page.dart';
import 'package:club_manager/pages/signup&login/register/health/health_page.dart';
import 'package:club_manager/pages/signup&login/register/notice/notice_page.dart';
import 'package:club_manager/pages/signup&login/register/select_time_period/time_period.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController controller = PageController();
  GeneralPage generalPage;
  EducationPage educationPage;
  FamilyStatusPage familyStatusPage;
  HealthPage health;
  NoticePage noticePage;
  TimePeriod timePer;
  Player play;
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
          health = HealthPage(
            controller: controller,
          ),
          noticePage = NoticePage(
            controller: controller,
            formKey: formKey,
            press: () {
              formKey.currentState.save();
              play = new Player(
                reagentCode: noticePage.reagentCode,
                address: familyStatusPage.address,
                birthday: generalPage.birthDay,
                coachName: educationPage.coachName,
                email: generalPage.email,
                family: generalPage.family,
                fatherPhone: familyStatusPage.fatherPhone,
                fatherWorks: familyStatusPage.fatherWorks,
                favoritePos: health.favorite,
                homePhone: familyStatusPage.homePhone,
                lastTeam: educationPage.lastTeam,
                motherPhone: familyStatusPage.motherPhone,
                name: generalPage.name,
                passport: generalPage.id,
                patientHistory: health.patient,
                schoolName: educationPage.schoolName,
                technicalFoot: health.technical,
              );
              //Navigator.pop(context);
              //print("success");
              controller.nextPage(duration: Duration(milliseconds: 1200), curve: Curves.linear);
//            Scaffold.of(context).showSnackBar(SnackBar(
//              content: Text("ثبت نام موفقیت آمیز بود"),
//              duration: Duration(seconds: 5),
//            ));
            },
          ),
          timePer = TimePeriod(controller: controller,func: (){
            play.timePeriod = timePer.selectedTime;
          },),
        ],
      ),
    );
  }

}
