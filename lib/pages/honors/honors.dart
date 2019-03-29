import 'package:club_manager/entity/honors_entity.dart';
import 'package:club_manager/widgets/honors_card.dart';
import 'package:flutter/material.dart';

class HonorView extends StatefulWidget {
  final List<HonorsEntity> honors;
  final bool isAdmin;

  HonorView({@required this.honors, @required this.isAdmin})
      : assert(honors != null);

  @override
  _HonorViewState createState() => _HonorViewState();
}

class _HonorViewState extends State<HonorView> {
  bool _isChanging = true;

  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isChanging = !_isChanging;
                });
              },
            )
          : Container(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BaseItem(
            imgURL: widget.honors[index].imgURL,
            title: widget.honors[index].title,
            description: widget.honors[index].description,
            onDelete: () {
              setState(() {
                //todo : delete a piece of honors here
                widget.honors.removeAt(index);
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
              TextEditingController(text: widget.honors[index].description);
          TextEditingController ctrlTitle =
              TextEditingController(text: widget.honors[index].title);
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
                          widget.honors[index] = HonorsEntity(
                              imgURL: widget.honors[index].imgURL,
                              title: ctrlTitle.text,
                              description: ctrlDesc.text);
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
