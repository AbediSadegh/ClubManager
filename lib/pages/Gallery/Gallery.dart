import 'package:club_manager/ServerProvider.dart';
import 'package:club_manager/URL.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/pages/Gallery/GalleryMainView.dart';
import 'package:club_manager/pages/Gallery/YearMenu.dart';
import 'package:club_manager/widgets/background.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
//  final Map<String, List<Photograph>> photos;
  final List<String> years;
  final bool isAdmin;



  Gallery({@required this.years, @required this.isAdmin}) {
    assert(years != null);
  }

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String currAlbum;
  CategoryItem categoryItem;
  bool isLoading;
  bool first;
  @override
  void initState() {
    isLoading= true;
    first = true;
    super.initState();
    _items = List();
  }
  static List<DropdownMenuItem<CategoryItem>> _items;
  static CategoryItem currVal;
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
  setState(() {
    first = false;
    isLoading = false;
    currVal = _items[0].value;
  });
  }

  @override
  Widget build(BuildContext context) {
//    assert(photos.isNotEmpty);
    if(first){
      getCategory();
    }
    assert(widget.years != null);
    Size _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            !isLoading ? GalleryTopBar(
              //currVal: currAlbum,
                items: _items,
                currentValue: currVal,
                years: widget.years,
              onChange: (CategoryItem item){
                setState(() {
                  currVal = item;
                  currAlbum = item.title;
                  //categoryItem = item;
                });
              }

//                  (str) {
//                if (str != currAlbum) {
//                  this.setState(() {
//                    currAlbum = str;
//                  });
//                }
//              },
            ) : SizedBox(height: 0,width: 0,),
          ],
        ),
        body: Stack(
          children: <Widget>[
            AppBackground(),
            !isLoading ?
            PhotoGallery(
              categoryItem: currVal,
              //currAlbum: currAlbum,
              deviceSize: _deviceSize,
              onChange: () {
                this.setState(() {});
              },
            ) : CircularProgressIndicator(),
          ],
        )) ;
    }
}
