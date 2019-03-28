import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:flutter/material.dart';

class GalleryBar extends StatefulWidget {
  final List<String> _years;
  final PhotoGallery _photoGallery;

  GalleryBar(this._years, this._photoGallery);

  State<GalleryBar> createState() => GalleryBarState();
}

class GalleryBarState extends State<GalleryBar> {
  List<DropdownMenuItem<String>> _items;
  String _currVal;

  @override
  void initState() {
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
          child: Text(
            '...پدیده های ',
          ),
        ),
      ),
    );
  }
}
