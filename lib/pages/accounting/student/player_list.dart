import 'package:club_manager/FakeEntity.dart';
import 'package:club_manager/pages/accounting/student/profile.dart';
import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  final String alephabetic;


  PlayerList({this.alephabetic});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            alephabetic,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              print(alephabetic);
              //if(players[index].name[0] == alephabetic)
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
