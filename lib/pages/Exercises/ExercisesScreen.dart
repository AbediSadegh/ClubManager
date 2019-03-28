import 'package:club_manager/widgets/Exercise.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/FakeEntity.dart';
import 'dart:math';

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    int i = 0;
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animation = Tween<double>(begin: 0, end: 592).animate(_controller)
      ..addListener(() {
        if (i < _animation.value / 50 && i < min(FakeData.tasks.length, 9)) {
          _listkey.currentState.insertItem(i, duration: Duration(seconds: 1));
          i++;
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          for (; i < FakeData.tasks.length; i++) {
            _listkey.currentState.insertItem(i, duration: Duration(seconds: 0));
          }
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  child: Opacity(
                    opacity:
                        _animation.value / 200 < 1 ? _animation.value / 200 : 1,
                    child: ClipPath(
                      clipper: DialogonalClipper(),
                      child: Image.network(
                        FakeData.srcImageExercise,
                        fit: BoxFit.cover,
                        height: 240,
                        colorBlendMode: BlendMode.srcOver,
                        color: Color.fromARGB(120, 20, 10, 40),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 240),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 5,
                          height: _animation.value,
                          color: Colors.grey[300],
                        ),
                        top: 0.0,
                        right: 17.0,
                      ),
                      EcerciseList()
                    ],
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 30,
                  child: Opacity(
                    opacity:
                        _animation.value / 200 < 1 ? _animation.value / 200 : 1,
                    child: Text(
                      'تمرینات',
                      style: TextStyle(fontSize: 34.0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}

class EcerciseList extends StatefulWidget {
  @override
  _EcerciseListState createState() => _EcerciseListState();
}

final GlobalKey<AnimatedListState> _listkey = GlobalKey();

class _EcerciseListState extends State<EcerciseList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listkey,
      itemBuilder: (context, index, animation) {
        Exercise t = Exercise(
            animation: animation,
            color: FakeData.tasks[index].color,
            title: FakeData.tasks[index].title,
            time: FakeData.tasks[index].time,
            subtitle: FakeData.tasks[index].subtitle);
        return t;
      },
    );
  }
}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - size.height / 3);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
