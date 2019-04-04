import 'package:club_manager/pages/accounting/coach/activity.dart';

class MonthActivity{
  final name;

  MonthActivity({this.name});

  List<Activity> activity =[
    Activity(title: "جلسه اول",
    cost: "20000",
    details: "بدون توضیحات",
      isPay: false
    ),
  ];
  int salary = 0;
  int cost = 0;
  int sum =0;
  void paidCost(){
    salary =0;
    cost =0;
    sum =0;
    for(int i =0 ; i < activity.length ; i++){
      sum += int.parse(activity[i].cost);
      if(activity[i].isPay){
        salary += int.parse(activity[i].cost);
      }
    }
    cost = sum - salary;
  }

}