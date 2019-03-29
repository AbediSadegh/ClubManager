import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutUs extends StatelessWidget {
  final String text;
  final String srcImage;
  final String title;

  const AboutUs(
      {Key key,
      @required this.text,
      @required this.srcImage,
      @required this.title})
      : assert(title != null),
        assert(srcImage != null),
        assert(text != null),
        super(key: key);

  Future<Text> buidVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Text(
      'نسخه : ${packageInfo.version}',
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * .05,),
          Container(
            height: 160,
            child: Image.network(
              srcImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Divider(color: Colors.red,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(color: Colors.red,),
          Center(
            child: FutureBuilder(
              future: buidVersion(),
              initialData: Text('نسخه :'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.data;
              },
            ),
          ),
        ],
      );
  }
}
