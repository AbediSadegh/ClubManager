import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/accounting/coach/show_detail_of_coach_accounting.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class NewCoachProfile extends StatefulWidget {
  final index;

  NewCoachProfile({this.index});

  @override
  _NewCoachProfileState createState() => _NewCoachProfileState();
}

class _NewCoachProfileState extends State<NewCoachProfile> {
  List _years =
  ["1398", "1399", "1400", "1401", "1402"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentYear;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentYear = _dropDownMenuItems[0].value;
    super.initState();
  }
  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String year in _years) {
      items.add(new DropdownMenuItem(
          value: year,
          child: new Text(year)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .30,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: NetworkImage(coaches[widget.index].pictureUrl),
                      ),
                    ),
                    //coaches[index].familyName
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نام :  " + coaches[widget.index].name,
                            style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("فامیل : " + coaches[widget.index].familyName,
                            style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("سال تولد : " +
                              coaches[widget.index].birthDayYear.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "صورتحساب",
                    style: TextStyle(fontSize: 45),
                  ),
                  Row(
                    children: <Widget>[
                      Text("اتخاب سال : "),
                      new DropdownButton(
                        value: _currentYear,
                        items: _dropDownMenuItems,
                        onChanged: changedDropDownItem,
                      ),
                    ],
                  )



                ],
              ),
            ),
            createMonth(name: "فروردین", color: Colors.green, onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 0,);
              }
              )
              );
            }
            ),
            createMonth(name: "اردیبهشت", color: Colors.green,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 1,);
              }
              )
              );
            }),
            createMonth(name: "خرداد", color: Colors.green,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 2,);
              }
              )
              );
            }),
            Divider(),
            createMonth(name: "تیر", color: Colors.redAccent,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 3,);
              }
              )
              );
            }),
            createMonth(name: "مرداد", color: Colors.redAccent,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 4,);
              }
              )
              );
            }),
            createMonth(name: "شهریور", color: Colors.redAccent,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 5,);
              }
              )
              );
            }),
            Divider(),
            createMonth(name: "مهر", color: Colors.orange,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 6,);
              }
              )
              );
            }),
            createMonth(name: "آبان", color: Colors.orange,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 7,);
              }
              )
              );
            }),
            createMonth(name: "آذر", color: Colors.orange,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 8,);
              }
              )
              );
            }),
            Divider(),
            createMonth(name: "دی", color: Colors.grey,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 9,);
              }
              )
              );
            }),
            createMonth(name: "بهمن", color: Colors.grey,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 10,);
              }
              )
              );
            }),
            createMonth(name: "اسفند", color: Colors.grey,onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShowMonthActivity(coachIndex: widget.index,monthIndex: 11,);
              }
              )
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget createMonth({String name, Color color, final onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text(name),
          leading: CircleAvatar(
            backgroundColor: color,
            child: Text(name[0], style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
  void changedDropDownItem(String selectedYear) {
    print(selectedYear);
    setState(() {
      _currentYear = selectedYear;
    });
  }

}
