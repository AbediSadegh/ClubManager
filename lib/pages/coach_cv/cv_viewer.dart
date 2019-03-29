import 'package:club_manager/entity/cv_entity.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/single_trainer_cv.dart';

class CVViewer extends StatefulWidget {
  final List<CVEntity> cvs;
  final bool isAdmin;

  CVViewer({@required this.cvs, @required this.isAdmin});

  @override
  _CVViewerState createState() => _CVViewerState();
}

class _CVViewerState extends State<CVViewer> {
  bool isChanging = true;

  Widget build(BuildContext context) {
    assert(widget.cvs != null);
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: Icon(Icons.mode_edit),
              onPressed: () {
                setState(() {
                  isChanging = !isChanging;
                  print('isChanging : $isChanging');
                });
              },
            )
          : Container(),
      body: ListView.builder(
        itemCount: widget.cvs.length,
        itemBuilder: (context, index) {
          return CV(
            imgURL: widget.cvs[index].imgURL,
            description: widget.cvs[index].description,
            license: widget.cvs[index].license,
            name: widget.cvs[index].name,
            education: widget.cvs[index].education,
            onEdit: () {
              edit(
                deviceSize: MediaQuery.of(context).size,
                context: context,
                index: index,
              );
            },
            onDelete: () {
              //todo : delete a Coach CV here
              setState(() {
                widget.cvs.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  Future edit({
    BuildContext context,
    int index,
    Size deviceSize, // can be any of description, name, license, education
  }) {
    TextEditingController ctrlName =
        TextEditingController(text: widget.cvs[index].name);
    TextEditingController ctrlEdu =
        TextEditingController(text: widget.cvs[index].education);
    TextEditingController ctrlLicense =
        TextEditingController(text: widget.cvs[index].license);
    TextEditingController ctrlDesc =
        TextEditingController(text: widget.cvs[index].description);
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 10.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.black12,
              ),
              height: deviceSize.height / 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: ctrlName,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: 'نام',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: ctrlEdu,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: 'تحصیلات',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: ctrlLicense,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'مدرک مربی گری',
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: ctrlDesc,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'توضیحات',
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                    maxLines: 8,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Color.fromRGBO(58, 58, 62, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        //todo do the server side for CV edit
                        setState(() {
                          widget.cvs[index].name = ctrlName.text;
                          widget.cvs[index].description = ctrlDesc.text;
                          widget.cvs[index].license = ctrlLicense.text;
                          widget.cvs[index].education = ctrlEdu.text;
                        });
                      },
                      child: Text('ذخیره'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
