import 'package:club_manager/widgets/carousel_slider.dart';
import 'package:club_manager/widgets/deletePermission.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/expandable.dart';

class BaseItem extends StatefulWidget {
  final String imgURL;
  final String title;
  final String description;
  final GestureTapCallback onDelete;
  final GestureTapCallback onEdit;

  BaseItem(
      {@required this.imgURL,
      @required this.title,
      @required this.description,
      this.onDelete,
      this.onEdit});

  State<BaseItem> createState() => BaseItemState();
}

class BaseItemState extends State<BaseItem> {
  final _editActive = false;

  Size deviceSize;

  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Container(
//      height: deviceSize.height*0.65,
      child: Card(
        color: Color.fromRGBO(240, 240, 240, 1.0),
        margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 10.5),
        elevation: 3.5,
        child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/logo.png',
//                  image: widget.imgURL,
                  image: 'https://picsum.photos/500/225?image=143',
                  alignment: Alignment.center,
                  height: deviceSize.height * 0.25,
                  width: deviceSize.width * 0.65,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
//              todo comment the above ClipRRect and uncomment the following
//              child: CarouselSlider(
//                items: List.generate(
//                  1,
//                  (index) => SizedBox(
//                        width: deviceSize.width * 0.65,
//                        child: Image.network(
//                          'https://picsum.photos/500/225?image=${index + 100}',
//                          fit: BoxFit.contain,
//                        ),
//                      ),
//                ),
//                aspectRatio: 1.777,
//                viewportFraction: 0.8,
//                enlargeCenterPage: true,
//              ),
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ),
            ExpandablePanel(
              header: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _editActive
                        ? RaisedButton(
                            elevation: 7.5,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return new DeleteOrNot(
                                      onDelete: widget.onDelete,
                                    );
                                  });
                            },
                            child: Text(
                              'حذف',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(58, 58, 62, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          )
                        : Container(),
                    Container(
                      width: deviceSize.width / 15,
                    ),
                    _editActive
                        ? RaisedButton(
                            elevation: 7.5,
                            onPressed: widget.onEdit,
                            child: Text(
                              'ویرایش',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(58, 58, 62, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          )
                        : Container(),
                    Container(
                      width: deviceSize.width / 15,
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 25.0, color: Color.fromRGBO(40, 40, 40, 1)),
                    ),
                  ],
                ),
                width: deviceSize.width,
              ),
              collapsed: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Color.fromRGBO(240, 240, 240, 1.0),
                ),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.description,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                    ),
                    Container(
                      width: deviceSize.width,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.expand_more,
                        color: Theme.of(context).dividerColor,
                      ),
                    )
                  ],
                ),
              ),
              expanded: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Color.fromRGBO(240, 240, 240, 1.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      widget.description,
                      softWrap: true,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Icon(Icons.expand_less, color: Theme.of(context).dividerColor)
                ],
              ),
              hasIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
