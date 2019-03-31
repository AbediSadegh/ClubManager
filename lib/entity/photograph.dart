library photograph;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/serializers.dart';

part 'photograph.g.dart';

abstract class Photograph implements Built<Photograph, PhotographBuilder> {
  String get thumbnail;
  String get photo;
  String get description;
  Photograph._();
  bool isVideo;

  factory Photograph([updates(PhotographBuilder b)]) = _$Photograph;

  String toJson() {
    return json.encode(serializers.serializeWith(Photograph.serializer, this));
  }

  static Photograph fromJson(String jsonString) {
    return serializers.deserializeWith(
        Photograph.serializer, json.decode(jsonString));
  }

  static Serializer<Photograph> get serializer => _$photographSerializer;
}
//List<Photograph> photos = [
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//];
//
//List<Photograph> photos1 = [
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//];
//
//List<Photograph> photos2 = [
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//];
//
//List<Photograph> photos3 = [
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//  Photograph('',
//      'http://a.espncdn.com/combiner/i?img=/photo/2015/0930/r12972_800x450_16-9.jpg'),
//  Photograph('',
//      'https://doctoryum.org/wp-content/uploads/2011/03/kids-playing-soccer.jpg'),
//  Photograph('',
//      'https://previews.123rf.com/images/matimix/matimix1801/matimix180100041/94492193-young-boys-watching-soccer-competition-from-bench-soccer-players-under-10-years-old-kids-football-cl.jpg'),
//  Photograph('',
//      'http://www.illuminea.com/wp-content/uploads/uploads/2009/02/500px-android-logosvg-300x300.png'),
//];
