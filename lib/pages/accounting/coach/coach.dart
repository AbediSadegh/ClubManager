import 'package:club_manager/pages/accounting/coach/month_activity.dart';

class Coach{
  String name;
  String familyName;
  int birthDayYear;
  String pictureUrl;
  List<MonthActivity> month = [
    MonthActivity(name: "فروردین"),
    MonthActivity(name: "اردیبهشت"),
    MonthActivity(name: "خرداد"),
    MonthActivity(name: "تیر"),
    MonthActivity(name: "مرداد"),
    MonthActivity(name: "شهریور"),
    MonthActivity(name: "مهر"),
    MonthActivity(name: "آبان"),
    MonthActivity(name: "آذر"),
    MonthActivity(name: "دی"),
    MonthActivity(name: "بهمن"),
    MonthActivity(name: "اسفند"),
  ];
  Coach({this.name, this.familyName, this.birthDayYear, this.pictureUrl});

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
