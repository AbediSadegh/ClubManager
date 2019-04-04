import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutUs extends StatefulWidget {
  final String type;

  AboutUs(this.type);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<Text> buidVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Text(
      'نسخه : ${packageInfo.version}',
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }
  bool  first;
  bool _isLoading;
  AboutProgrammerListEntity data;

  @override
  void initState() {
    _isLoading = true;
    first = true;
    super.initState();
  }

  getdata({String page}) async {
    _isLoading = true;
    data = await loadAboutProgrammer(page);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (first){
      first = false;
      if (widget.type=="po")
        getdata(page: URL.urlAboutProgremmer);
      else
        getdata(page:URL.urlAboutPadideh );
    }
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Container(
                height: 160,
                child: Image.network(
                  data.results[0].image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Divider(
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  data.results[0].content,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Divider(
                color: Colors.red,
              ),
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
