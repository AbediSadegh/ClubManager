import 'dart:async';

import 'package:flutter/material.dart';

class ResendCode extends StatefulWidget {
  final ontap;

  ResendCode({this.ontap});

  @override
  _ResendCodeState createState() => _ResendCodeState(ontap: ontap);
}

class _ResendCodeState extends State<ResendCode> {
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
              } else {
                _start = _start - 1;
              }
            }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  final ontap;

  _ResendCodeState({this.ontap});

  @override
  Widget build(BuildContext context) {
    return _start != 0
        ? Text("$_start" + " : " + "فرستادن دوباره کد")
        : GestureDetector(
            child: Text("فرستادن محدد"),
            onTap: ontap,
          );
  }
}
