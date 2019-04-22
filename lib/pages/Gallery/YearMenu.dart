import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';

class GalleryTopBar extends StatefulWidget {
  final List<String> years;
  final ValueChanged<CategoryItem> onChange;
  final CategoryItem currentValue;
  final items;

  GalleryTopBar({this.items, this.years, this.onChange, this.currentValue});

  State<GalleryTopBar> createState() => GalleryTopBarState();
}

class GalleryTopBarState extends State<GalleryTopBar> {
  bool isLoading = false;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Theme(
            data: ThemeData(
              canvasColor: Theme.of(context).primaryColorDark,
            ),
            child: DropdownButton<CategoryItem>(
              elevation: 15,
              iconSize: 25.0,
              items: widget.items,
              style: TextStyle(inherit: false, color: Colors.white),
              value: widget.currentValue,
              onChanged: widget.onChange,
            ),
          ),
          Container(
            width: 15.0,
          ),
          Text(
            ': متولدین سال ',
            style: TextStyle(inherit: false, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
