import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
      home: CameraPicker(),
    ));

File _image;
final Color gradientEnd = Color(0xff676bc2);


class CameraPicker extends StatefulWidget {

  File getFile(){
    if (_image!=null) {
      print("file is correct");
      return _image;
      
    }else print("null");
    return null;
  }

  @override
  _CameraPicker createState() => _CameraPicker();

}

class _CameraPicker extends State<CameraPicker> {
  //File _image;
  File imageSave;

  _CameraPicker();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      imageSave = image;
    });
  }
//  void getPicture(){
//    return imageSave(_image);
//  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: _image == null
            ? Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Image(
                    height: 150,
                    width: 150,
                    image: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/user-interface-33/80/App_Interface_new-07-512.png"),
                  ),
                  GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add,color: gradientEnd,),
                      ))
                ],
              )
            : Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        image: DecorationImage(
                            image: FileImage(_image), fit: BoxFit.contain)),
                  ),
                  GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ))
                ],
              )
        //decoration: ShapeDecoration(shape: CircleBorder(),image: DecorationImage(image: FileImage(_image),fit: BoxFit.contain)),

        );
//      floatingActionButton: FloatingActionButton(
//        onPressed: getImage,
//        tooltip: 'Pick Image',
//        child: Icon(Icons.add_a_photo),
//      ),
    //);
  }
}
