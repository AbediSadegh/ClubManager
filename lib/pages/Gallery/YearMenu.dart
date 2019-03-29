import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:flutter/material.dart';

class GalleryBar extends StatefulWidget {
  final List<String> years;
  final PhotoGallery photoGallery;
  final String initValue;

  GalleryBar({this.years, this.photoGallery,this.initValue});

  State<GalleryBar> createState() => GalleryBarState();
}

class GalleryBarState extends State<GalleryBar> {
  List<DropdownMenuItem<String>> _items;
  String _currVal;

  @override
  void initState() {
    super.initState();
    _currVal = widget.initValue;
    _items = List();
    assert(widget.years != null);
    widget.years.forEach((val) {
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
        iconSize: 0,
        style: TextStyle(color: Colors.black),
        items: _items,
        value: _currVal,
        onChanged: (String newVal) {
          if (_currVal != newVal)
            setState(() {
              _currVal = newVal;
              widget.photoGallery.state.galleryPageTrans(newVal);
            });
        },
      ),
    );
  }
}
