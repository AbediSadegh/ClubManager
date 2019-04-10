import 'package:club_manager/pages/accounting/coach/month_activity.dart';
import 'package:meta/meta.dart';

class YearActivity{
  final int year;
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

  YearActivity({@required this.year});


}