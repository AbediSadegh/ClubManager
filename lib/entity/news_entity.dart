library news_entity;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/serializers.dart';

part 'news_entity.g.dart';

abstract class NewsEntity implements Built<NewsEntity, NewsEntityBuilder> {
  String get imgURL;
  String get title;
  String get description;
  String get shortDesc;

  NewsEntity._();

  factory NewsEntity([updates(NewsEntityBuilder b)]) = _$NewsEntity;

  String toJson() {
    return json.encode(serializers.serializeWith(NewsEntity.serializer, this));
  }

  static NewsEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewsEntity.serializer, json.decode(jsonString));
  }

  static Serializer<NewsEntity> get serializer => _$newsEntitySerializer;
}
