import 'package:club_manager/LoginData.dart';
import 'package:club_manager/pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegentCodePage extends StatefulWidget {
  @override
  _RegentCodePageState createState() => _RegentCodePageState();
}



class _RegentCodePageState extends State<RegentCodePage>  {
  final Color gradientEnd = Color(0xff676bc2);
  bool isLoading ;
  @override
  void initState() {
    isLoading = true;
    super.initState();
  }
  void getPhone()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
     LoginData.username = sp.getString('token');
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading){
      getPhone();
      isLoading  = false;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: gradientEnd,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              Text("کد معرف",style: TextStyle(color: Colors.white,fontSize: 30)),
              Divider(color: Colors.amber,height: 25,),
              SizedBox(height: MediaQuery.of(context).size.height * .13,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "در صورت معرفی دو نفر به مدرسه فوتبال پدیده شهرخودرو یک ماه شما رایگان خواهد بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 17),),
              ),
              //todo باید کد معرف از طرف سرور هندل شود
              SizedBox(height: MediaQuery.of(context).size.height * .10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("کدمعرف : ",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16,color: Colors.amber),),
                  Text(LoginData.username,style: TextStyle(color: Colors.amber,fontSize: 16),),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              FlatButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),child: Text("بازگشت به صفحه اصلی",style: TextStyle(color: Colors.purple),),color: Colors.white,
              onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){return MainPage();}));
              },),
            ],
          ),
        ),
      ),
    );
  }
}
