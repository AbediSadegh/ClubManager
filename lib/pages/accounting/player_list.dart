import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/profile.dart';
import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "مشاهده پروفایل و صورتحساب ها",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile(
                      index: index,
                    );
                  }));
                },
                title: Text(players[index].name + " " + players[index].family),
                //isThreeLine: true,
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                ),
              );
            }),
      ),
    );
  }
}
