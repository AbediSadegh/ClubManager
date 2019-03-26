import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class NoticeForm extends StatelessWidget {
  final double fontSize = 16;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("مسولیت فرزند شما تنها در زمان تمرین(یک ساعت و نیم) "
                  " به عهده ی مجموعه مدرسه فوتبال پدیده میباشد و در  "
                  "خارج از زمان تمرین(قبل از شروع و بعد از اتمام "
                  "مجموعه باشگاه و مدرسه فوتبال پدیده هیچگونه مسولیتی "
                  "به فرزند شما نخواهد داشت.",style: TextStyle(color: Colors.white,fontSize: fontSize),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("توجه: در ضورت مشکل و عدم حضور در کلاس تنها میتوانید "
                  "فرد دیگری را جایگزین کنید وجه و شهریه پرداختی به "
                  "هیچ وجه مستردد نگردد ",style: TextStyle(color: Colors.white, fontSize: fontSize),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("خواهشمند است در سایت فدراسیون بیمه ورزشی به آدرس زیل فرزند خود را در اسرع وقت "
                  "بیمه کنید و کپی آن را تحویل مسول باشگاه دهید",style: TextStyle(color: Colors.white,fontSize: fontSize),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text("insurance.ifsm.ir/useronline/login",style: TextStyle(color: Colors.amber,fontSize: fontSize),),
                onTap:_launchURL,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


_launchURL() async {
  const url = 'http://insurance.ifsm.ir/useronline/login';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}