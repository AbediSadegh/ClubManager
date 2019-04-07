import 'package:club_manager/pages/accounting/coach/activity.dart';

class MonthActivity{
  final name;
  int hozoor=0;
  int delay=0;
  int absent=0;
  int numberOfSection;
  MonthActivity({this.name});

  List<Activity> activity =[
    Activity(title: "جلسه اول",
    cost: "20000",
    //details: "بدون توضیحات",
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
      //print(activity[i].cost);

      if(activity[i].isPay){
        //print(activity[i].cost);
        print(int.parse(activity[i].cost));
        salary += int.parse(activity[i].cost);
      }else sum += int.parse(activity[i].cost);
    }
    print("sum" + sum.toString());
    print("salary"+salary.toString());
    cost = sum - salary;
    print("cost"+ cost.toString());
  }

}