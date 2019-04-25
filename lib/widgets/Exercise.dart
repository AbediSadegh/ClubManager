import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;
  final String description;
  final bool completed;
  final Animation<double> animation;

  Exercise(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.time,
      @required this.color,
      @required this.description,
      this.completed,
      this.animation})
      : assert(title != null),
        assert(subtitle != null),
        assert(time != null),
        assert(color != null),
        super(key: key);

  final dotSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (a) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  '$description',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Container(
              width: dotSize,
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: dotSize,
              child: Center(
                child: Container(
                  height: animation.value * dotSize,
                  width: animation.value * dotSize,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
              ),
            ),
            SizedBox(
              width: (1 - animation.value) * 50,
            ),
            Expanded(
              child: Opacity(
                opacity: animation.value,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                time,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
