import 'package:flutter/material.dart';

class CV extends StatelessWidget {
  Size _size;

  final String imgURL;
  final String name;
  final String license;
  final String education;
  final String description;

  CV(
      {@required this.imgURL,
      @required this.name,
      @required this.license,
      this.education,
      @required this.description})
      : assert(imgURL != null &&
            imgURL.isNotEmpty &&
            name != null &&
            name.isNotEmpty &&
            license != null &&
            license.isNotEmpty &&
            description != null &&
            description.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Card(
      color: Color(0xFFd9d9d9),
      elevation: 7.5,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Container(
        width: _size.width,
        height: 2 * _size.height / 7,
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
                      _size.width / 8,
                      _size.width / 8,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            this.name,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          Text(this.education,
                              style: TextStyle(
                                  fontSize: 11.0, color: Colors.white)),
                        ],
                      ),
                      Icons.person),
                  _rowBuilder(
                      _size.width / 8,
                      _size.width / 8,
                      Text(
                        this.license,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      Icons.rate_review),
                  Expanded(
                    flex: 3,
                    child: _rowBuilder(
                        _size.width / 8,
                        double.infinity,
                        Text(
                          this.description,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                          softWrap: true,
                          maxLines: 5,
                        ),
                        Icons.description),
                  ),
                ],
              ),
            ),
            Container(
              height: 2 * _size.height / 7,
              decoration: BoxDecoration(
                color: Color(0xFFcf3030),
              ),
              margin: EdgeInsets.only(left: 3.0, bottom: 2.0),
              child: FadeInImage.assetNetwork(
                width: _size.width / 3,
                placeholder: 'assets/images/vip.png',
                image: this.imgURL,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowBuilder(double width, double height, Widget child, IconData icon) {
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
          color: Color(0xFFe88a1a),
          child: Icon(
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
              color: Color(0xFFe88a1a),
              child: child),
        ),
      ],
    );
  }
}
