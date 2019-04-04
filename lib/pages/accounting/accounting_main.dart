import 'package:club_manager/pages/accounting/accounting.dart';
import 'package:club_manager/pages/accounting/addSalary.dart';
import 'package:club_manager/pages/accounting/coach/coach_list.dart';
import 'package:club_manager/pages/accounting/player_list.dart';
import 'package:club_manager/pages/accounting/profile.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() =>
    runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: Example()));

class Example extends StatefulWidget {
  _Example createState() => _Example();
}

class _Example extends State<Example> {
  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "پرداختی",
        currentButton: FloatingActionButton(
          heroTag: "پرداختی",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.assignment_late),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Salary(
                    isSalary: true,
                  );
                });
          },
        ))
    );

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "دریافتی",
        currentButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Salary(
                      isSalary: false,
                    );
                  });
            },
            heroTag: "دریافتی",
            backgroundColor: Colors.green,
            mini: true,
            child: Icon(Icons.assessment))));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "وضعیت افراد",
        currentButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PlayerList();
              }));
            },
            heroTag: "وضعیت افراد",
            backgroundColor: Colors.green,
            mini: true,
            child: Icon(Icons.person))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "وضعیت مربی ها",
        currentButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CoachList();
              }));
            },
            heroTag: "وضعیت مربی ها",
            backgroundColor: Colors.green,
            mini: true,
            child: Icon(Icons.person))));
    return Scaffold(
      //backgroundColor: Colors.deepPurpleAccent,
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "حسابداری",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: accounting(),
    );
  }

}
