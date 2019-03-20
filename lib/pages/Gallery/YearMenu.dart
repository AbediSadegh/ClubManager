import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dummy/finalpack/GalleryMainView.dart';

class YearMenu extends StatefulWidget {
  final List<String> _years;
  final PhotoGallery _photoGallery;

  YearMenu(this._years, this._photoGallery);

  State<YearMenu> createState() => YearMenuState();
}

class YearMenuState extends State<YearMenu> {
  List<DropdownMenuItem<String>> _items;
  String _currVal;

  @override
  void initState(){
    super.initState();
    _items = List();
    assert(widget._years != null);
    widget._years.forEach((val) {
      _items.add(DropdownMenuItem<String>(
        value: val,
        child: Container(
          child: Text(
            val,
            textDirection: TextDirection.rtl,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.center,
        ),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      alignment: Alignment.centerRight,
      width: 550.0,
      height: 55.0,
      child: DropdownButton(
        elevation: 0,
//        isExpanded: true,
        iconSize: 0,
        style: TextStyle(color: Colors.black),
        items: _items,
        value: _currVal,
        onChanged: (String newVal) {
          if (_currVal != newVal)
            setState(() {
              _currVal = newVal;
              widget._photoGallery.state.galleryPageTrans(newVal);
            });
        },
        hint: Container(
//          alignment: Alignment.center,
          child: Text(
            '...پدیده های ',
          ),
        ),
      ),
    );
  }
}
