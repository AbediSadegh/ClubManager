import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/material.dart';

class GalleryTopBar extends StatefulWidget {
  final List<String> years;

  final ValueChanged<String> onChange;

  GalleryTopBar({this.years, this.onChange});

  State<GalleryTopBar> createState() => GalleryTopBarState();
}

class GalleryTopBarState extends State<GalleryTopBar> {
  static List<DropdownMenuItem<CategoryItem>> _items;
  static CategoryItem currVal= _items[0].value;
  bool isLoading = false;
  CategoryItemList categoryItemList;
  getCategory({String page: URL.galleryCategory})async{
    categoryItemList = await getCategoryList(url: page);
    categoryItemList.categoryList.forEach((val) {
      _items.add(DropdownMenuItem<CategoryItem>(
        value: val,
        child: Container(
          child: Text(
            val.title,
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white),
          ),
          alignment: Alignment.center,
        ),
      ));
    }
    );
    isLoading = true;
  }

  @override
  void initState() {
    super.initState();
    _items = List();
    //assert(widget.years != null);

  }



  Widget build(BuildContext context) {
    if(!isLoading){
      getCategory();
    }
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
              items: _items,
              style: TextStyle(inherit: false, color: Colors.white),
              value: currVal,
              //onChanged: widget.onChange,
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
