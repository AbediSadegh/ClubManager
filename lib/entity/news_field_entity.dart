library news_field_entity;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/serializers.dart';

part 'news_field_entity.g.dart';

abstract class NewsFieldEntity
    implements Built<NewsFieldEntity, NewsFieldEntityBuilder> {
  String get url;
  int get id;
  String get title;
  String get content;
  @nullable
  BuiltList<String> get newsImages;

  NewsFieldEntity._();

  factory NewsFieldEntity([updates(NewsFieldEntityBuilder b)]) =
      _$NewsFieldEntity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(NewsFieldEntity.serializer, this));
  }

  static NewsFieldEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewsFieldEntity.serializer, json.decode(jsonString));
  }

  static Serializer<NewsFieldEntity> get serializer =>
      _$newsFieldEntitySerializer;
}
