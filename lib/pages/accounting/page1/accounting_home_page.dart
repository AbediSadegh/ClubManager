import 'package:club_manager/pages/accounting/general_information/accounting_main.dart';
import 'package:club_manager/pages/accounting/student/alphabetic.dart';
import 'package:club_manager/pages/accounting/coach/coach_list.dart';
import 'package:flutter/material.dart';

class AccountingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int color = Colors.orange.value;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              new Opacity(
                opacity: .25,
                child: new Container(
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://previews.123rf.com/images/nadiinko/nadiinko1807/nadiinko180700068/104413180-financial-accounting-seamless-pattern-with-flat-line-icons-bookkeeping-background-tax-optimization-l.jpg"),
                          repeat: ImageRepeat.repeat),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    child: Center(
                      child: Text(
                        "حسابداری",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      ),
                    ),
                  ),
                  pageNavigatorAccounting(
                      title: "وضعیت پرداختی ها",
                      context: context,
                      func: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Example();
                        }));
                      },
                      color: Color(color).withAlpha(200)),
                  pageNavigatorAccounting(
                      title: "وضعیت چک ها",
                      context: context,
                      func: () {},
                      color: Color(color).withAlpha(175)),
                  pageNavigatorAccounting(
                      title: "فوتبالیست ها",
                      context: context,
                      func: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return Alephabetic();}));
                      },
                      color: Color(color).withAlpha(150)),
                  pageNavigatorAccounting(
                      title: "مربیان",
                      context: context,
                      func: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return CoachList();}));
                      },
                      color: Color(color).withAlpha(100)),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
              const Color(0xff2c5364),
              const Color(0xff0f2027)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
      ),
    );
  }

  Widget pageNavigatorAccounting(
      {BuildContext context, String title, final func, final color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: GestureDetector(
        onTap: func,
        child: Container(
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .95,
          decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        ),
      ),
    );
  }
}
