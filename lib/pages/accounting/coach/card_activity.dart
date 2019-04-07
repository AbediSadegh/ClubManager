import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  final monthIndex;
  final coachIndex;
  final activityIndex;
  final onLongPress;
  final yearIndex=0;
  CardActivity(
      {
        this.onLongPress,
        @required this.monthIndex,
      @required this.coachIndex,
      @required this.activityIndex});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        //onLongPress: onLongPress,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(8),
          child: Container(
//            height: coaches[coachIndex]
//                .month[monthIndex]
//                .activity[activityIndex]
//                .isPay
//                ? MediaQuery.of(context).size.height*.4
//                : MediaQuery.of(context).size.height*.2,
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("عنوان : "),
                      Text(coaches[coachIndex]
                          .yearActivity[yearIndex]
                          .month[monthIndex]
                          .activity[activityIndex]
                          .title),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("هزینه : "),
                      Text(coaches[coachIndex]
                          .yearActivity[yearIndex]
                          .month[monthIndex]
                          .activity[activityIndex]
                          .cost),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("وضعیت : "),
                      coaches[coachIndex]
                          .yearActivity[yearIndex]
                          .month[monthIndex]
                          .activity[activityIndex].text,
//                      Text(
//                        coaches[coachIndex]
//                            .yearActivity[yearIndex]
//                                .month[monthIndex]
//                                .activity[activityIndex]
//                                .isPay
//                            ? "پرداخت شده"
//                            : "پرداخت نشده",
//                        style: TextStyle(
//                            color: coaches[coachIndex]
//                                .yearActivity[yearIndex]
//                                    .month[monthIndex]
//                                    .activity[activityIndex]
//                                    .isPay
//                                ? Colors.green
//                                : Colors.redAccent),
//                      ),
                    ],
                  ),
                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: coaches[coachIndex]
//                      .yearActivity[yearIndex]
//                          .month[monthIndex]
//                          .activity[activityIndex]
//                          .isPay
//                      ? Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text("توضیحات : "),
//                            Text(coaches[coachIndex]
//                                .yearActivity[yearIndex]
//                                .month[monthIndex]
//                                .activity[activityIndex]
//                                .details),
//                          ],
//                        )
//                      : SizedBox(
//                          height: 0,
//                        ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
