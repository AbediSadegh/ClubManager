import 'package:club_manager/widgets/Exercise.dart';
import 'package:flutter/material.dart';

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
        if (i < _animation.value / 50 && i < tasks.length) {
          _listkey.currentState.insertItem(i, duration: Duration(seconds: 1));
          i++;
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          for (; i < tasks.length; i++) {
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
        builder: (context, child) => Stack(
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
            color: tasks[index].color,
            title: tasks[index].title,
            time: tasks[index].time,
            subtitle: tasks[index].subtitle);
        return t;
      },
    );
  }
}

List<Exercise> tasks = [
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
  Exercise(
      title: "تمرین بدنسازی",
      subtitle: "همه سنین",
      time: "بظ۵",
      color: Colors.orange,
      completed: false),
  Exercise(
      title: "نرمش صبحگاهی",
      subtitle: "زیر ۱۲ سال",
      time: "۷قظ",
      color: Colors.cyan,
      completed: true),
  Exercise(
      title: "تمرین دروازه بانان",
      subtitle: "دست کش فراموش نشود",
      time: "۲بظ",
      color: Colors.pink,
      completed: false),
];
