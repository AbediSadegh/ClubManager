library news_page_entity;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/news_entity.dart';
import 'package:club_manager/entity/serializers.dart';

part 'news_page_entity.g.dart';

abstract class NewsPageEntity
    implements Built<NewsPageEntity, NewsPageEntityBuilder> {
  int get count;
  @nullable
  String get next;
  @nullable
  String get previous;
  @nullable
  BuiltList<NewsEntity> get results;

  NewsPageEntity._();

  factory NewsPageEntity([updates(NewsPageEntityBuilder b)]) = _$NewsPageEntity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(NewsPageEntity.serializer, this));
  }

  static NewsPageEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewsPageEntity.serializer, json.decode(jsonString));
  }

  static Serializer<NewsPageEntity> get serializer =>
      _$newsPageEntitySerializer;
}
