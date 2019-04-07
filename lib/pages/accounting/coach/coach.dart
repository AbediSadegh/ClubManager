import 'package:club_manager/pages/accounting/coach/year_activity.dart';

class Coach{
  String name;
  String familyName;
  int birthDayYear;
  String pictureUrl;
  int onTime;
  int delay;
  int absent;
//  List<MonthActivity> month = [
//    MonthActivity(name: "فروردین"),
//    MonthActivity(name: "اردیبهشت"),
//    MonthActivity(name: "خرداد"),
//    MonthActivity(name: "تیر"),
//    MonthActivity(name: "مرداد"),
//    MonthActivity(name: "شهریور"),
//    MonthActivity(name: "مهر"),
//    MonthActivity(name: "آبان"),
//    MonthActivity(name: "آذر"),
//    MonthActivity(name: "دی"),
//    MonthActivity(name: "بهمن"),
//    MonthActivity(name: "اسفند"),
//  ];

  List<YearActivity> yearActivity = [
    YearActivity(year: 1398),
    YearActivity(year: 1399),
    YearActivity(year: 1400),
    YearActivity(year: 1401),
    YearActivity(year: 1402),
  ];

  Coach({this.name, this.familyName, this.birthDayYear, this.pictureUrl});

  String attendanceTrueCost = "25000";
  String attendanceFalseCost = "0";
  String delayCost = "10000";
}

List<Coach> coaches = [
  Coach(
    name: "امیرحسن",
    birthDayYear: 78,
    familyName:"ابراهیمی",
    pictureUrl: "https://24smi.org/public/media/celebrity/2018/02/14/btxsnxej0xqq-david-beckham.jpg",
  ),
  Coach(
    name: "حسین",
    familyName: "جمالی",
    pictureUrl: "",
    birthDayYear: 77,
  ),
];
