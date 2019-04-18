import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/signup&login/player.dart';
import 'package:club_manager/pages/signup&login/register/education_status/education_page.dart';
import 'package:club_manager/pages/signup&login/register/family_status/FamilyStatusPage.dart';
import 'package:club_manager/pages/signup&login/register/general_information/general_page.dart';
import 'package:club_manager/pages/signup&login/register/health/health_page.dart';
import 'package:club_manager/pages/signup&login/register/notice/notice_page.dart';
import 'package:club_manager/pages/signup&login/register/select_time_period/time_period.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController controller = PageController();
  GeneralPage generalPage;
  EducationPage educationPage;
  FamilyStatusPage familyStatusPage;
  HealthPage health;
  NoticePage noticePage;
  TimePeriod timePer;
  Player play;
  bool first;
  bool _isLoading;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  RegisterEntity registerEntity;

  @override
  void initState() {
    _isLoading = false;
    first = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
            isLoading: _isLoading,
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
              if (first) {
                first = false;
                sendData();
              }
            },
          ),
          timePer = TimePeriod(controller: controller),
        ],
      ),
    );
  }

  sendData({String page: URL.register}) async {
    setState(() {
      _isLoading = true;
    });
    registerEntity = await register(url: page);
    setState(() {
      _isLoading = false;
    });
    if (registerEntity != null) {
      _saveToekn(URL.token);
      controller.nextPage(
          duration: Duration(milliseconds: 1200), curve: Curves.linear);
    } else {
      key.currentState.showSnackBar(SnackBar(
        content: Text("خطا در برقراری ارتباط با سرور"),
      ));
      first = true;
    }
  }

  _saveToekn(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
