import 'dart:io';

import 'package:club_manager/entity/honors_entity.dart';
import 'package:club_manager/widgets/honors_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
              child: Icon(Icons.add),
              onPressed: () {
                editAdd(context, 0, deviceSize, true);
              },
            )
          : Container(),
      body: ListView.builder(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.65 ),
        itemCount: widget.honors.length,
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
              editAdd(context, index, deviceSize, false);
            },
          );
        },
      ),
    );
  }

  Future editAdd(BuildContext context, int index, Size deviceSize, bool isAdd) {
    return showDialog(
        context: context,
        builder: (context) {
          File image;
          TextEditingController ctrlDesc = TextEditingController(
              text: isAdd ? '' : widget.honors[index].description);
          TextEditingController ctrlTitle = TextEditingController(
              text: isAdd ? '' : widget.honors[index].title);
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
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                            maxLines: 6),
                      )),
                  Container(
                    width: deviceSize.width,
                    height: 1.0,
                    color: Color.fromRGBO(58, 58, 62, 1.0),
                  ),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                                maxLines: 6),
                          ),
                          Visibility(
                            visible: isAdd,
                            child: Positioned(
                              bottom: 5.0,
                              left: 5.0,
                              child: Visibility(
                                visible: isAdd,
                                child: ClipOval(
                                  child: FlatButton(
                                    color: Color.fromRGBO(58, 58, 62, 1.0),
                                    onPressed: () async {
                                      image = await ImagePicker.pickImage(
                                          source: ImageSource.gallery);
                                    },
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
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
                        if (isAdd) {
                          //todo add image here
                        } else
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
