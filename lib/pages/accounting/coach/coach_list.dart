import 'package:club_manager/pages/accounting/coach/coach.dart';
import 'package:club_manager/pages/accounting/coach/new_coach_profile.dart';
import 'package:flutter/material.dart';

class CoachList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "انتخاب مربی",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
          itemCount: coaches.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NewCoachProfile(
                    index: index,
                  );
                }));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text(
                  coaches[index].name[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(coaches[index].name),
            );
          }),
    );
  }
}
