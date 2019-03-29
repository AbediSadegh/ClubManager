import 'package:club_manager/entity/news_entity.dart';
import 'package:club_manager/widgets/news_card.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final List<NewsEntity> news;
  final bool isAdmin;

  News({@required this.news, @required this.isAdmin}) : assert(news != null);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  bool _isChanging = true;

  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: widget.isAdmin? FloatingActionButton(
        onPressed: (){
          setState((){
            NewsItemPreview.setChange = !NewsItemPreview.setChange;
            print(NewsItemPreview.setChange);
          });
        },
      ): Container(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return NewsItemPreview(
            imgURL: widget.news[index].imgURL,
            title: widget.news[index].title,
            description: widget.news[index].description,
            shortDesc: widget.news[index].shortDesc,
            onDelete: () {
              setState(() {
                //todo : delete a piece of news here
                widget.news.removeAt(index);
              });
            },
            onEdit: () {
              edit(context, index, deviceSize);
            },
          );
        },
      ),
    );
  }

  Future edit(BuildContext context, int index, Size deviceSize) {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController ctrlDesc =
              TextEditingController(text: widget.news[index].description);
          TextEditingController ctrlTitle =
              TextEditingController(text: widget.news[index].title);
          TextEditingController ctrlShortDesc =
              TextEditingController(text: widget.news[index].shortDesc);
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black12),
              height: deviceSize.height / 2,
              child: new Column(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: new TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: ctrlDesc,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black45),
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'توضیحات',
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                          maxLines: 6)),
                  Container(
                    width: deviceSize.width,
                    height: 1.0,
                    color: Color.fromRGBO(58, 58, 62, 1.0),
                  ),
                  Expanded(
                      flex: 2,
                      child: new TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: ctrlTitle,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black45),
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'تیتر',
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                          maxLines: 6)),
                  Container(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(58, 58, 62, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        )),
                    alignment: Alignment.center,
                    child: new FlatButton(
                      child: new Text(
                        'ذخیره',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.news[index] = NewsEntity(
                            imgURL: widget.news[index].imgURL,
                            title: ctrlTitle.text,
                            description: ctrlDesc.text,
                            shortDesc: ctrlShortDesc.text,
                          );
                          //todo do the change stuff here
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
