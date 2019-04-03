class PhotoEntityList {
  String content;
  String title;
  String image;
  String file;
  bool is_video;

  PhotoEntityList(
      {this.content, this.title, this.image, this.file, this.is_video});

  factory PhotoEntityList.fromJson(Map<String, dynamic> parsedJson) {
    return PhotoEntityList(
        content: parsedJson['content'],
        title: parsedJson['title'],
        file: parsedJson['file'],
        is_video: parsedJson['is_video'],
        image: parsedJson['image']);
  }
}

class PhotoList {
  int count;
  String next;
  String previous;
   List<PhotoEntityList> results;

  factory PhotoList.fromJson(Map<String, dynamic> parsedJson) {
    List<PhotoEntityList> convert() {
      var list = parsedJson['results'] as List;
      List<PhotoEntityList> imagesList =
          list.map((i) => PhotoEntityList.fromJson(i)).toList();
      return imagesList;
    }

    return PhotoList(
        count: parsedJson['count'],
        next: parsedJson['next'],
        previous: parsedJson['previous'],
        results: convert());
  }

  PhotoList({this.count, this.next, this.previous, this.results});
}
