import 'package:flutter/material.dart';

class CV extends StatefulWidget {
  final String imgURL;
  final String name;
  final String license;
  final String education;
  final String description;

  CV({
    @required this.imgURL,
    @required this.name,
    @required this.license,
    this.education,
    @required this.description,
  }) : assert(imgURL != null &&
            imgURL.isNotEmpty &&
            name != null &&
            name.isNotEmpty &&
            license != null &&
            license.isNotEmpty &&
            description != null &&
            description.isNotEmpty);

  @override
  _CVState createState() => _CVState();
}

class _CVState extends State<CV> {
  Size _size;

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    double cardHeight = 2 * _size.height / 7;
    return Card(
      color: Color(0xFFd9d9d9),
      elevation: 7.5,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Container(
        width: _size.width,
        height: cardHeight,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _rowBuilder(
                    width: _size.width / 8,
                    height: _size.width / 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          this.widget.name,
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        Text(this.widget.education,
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white)),
                      ],
                    ),
                    icon: Icons.person,
                  ),
                  _rowBuilder(
                    width: _size.width / 8,
                    height: _size.width / 8,
                    child: Text(
                      this.widget.license,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    icon: Icons.rate_review,
                  ),
                  Expanded(
                    flex: 3,
                    child: _rowBuilder(
                      width: _size.width / 8,
                      height: double.infinity,
                      child: Text(
                        this.widget.description,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      icon: Icons.description,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorLight),
              margin: EdgeInsets.only(left: 3.0, bottom: 2.0),
              child: Stack(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    width: _size.width / 3,
                    height: double.infinity,
                    placeholder: 'assets/images/vip.png',
                    image: this.widget.imgURL,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowBuilder({
    double width,
    double height,
    Widget child,
    IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          margin: EdgeInsets.only(bottom: 2.0),
          color: Theme.of(context).primaryColorLight,
          child: isEditing
              ? FlatButton(
                  child: Icon(
                    Icons.mode_edit,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  onPressed: () {},
                )
              : Icon(
                  icon,
                  color: Colors.white,
                  size: 15.0,
                ),
        ),
        Container(
          width: 2.0,
        ),
        Expanded(
          flex: 1,
          child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              margin: EdgeInsets.only(bottom: 2.0),
              height: height,
              color: Theme.of(context).primaryColorLight,
              child: child),
        ),
      ],
    );
  }
}
