import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:flutter/material.dart';

class GalleryTopBar extends StatefulWidget {
  final List<String> years;
  final String currVal;
  final ValueChanged<String> onChange;

  GalleryTopBar({this.years, this.currVal, this.onChange});

  State<GalleryTopBar> createState() => GalleryTopBarState();
}

class GalleryTopBarState extends State<GalleryTopBar> {
  List<DropdownMenuItem<String>> _items;

  @override
  void initState() {
    super.initState();
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
//          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.center,
        ),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          DropdownButton(
            elevation: 15,
            iconSize: 25.0,
            style: TextStyle(color: Colors.black),
            items: _items,
            value: widget.currVal,
            onChanged: widget.onChange,
          ),
          Container(
            width: 15.0,
          ),
          Text(
            ': متولدین سال ',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
