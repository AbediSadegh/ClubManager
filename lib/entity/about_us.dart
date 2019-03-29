library about_us;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/serializers.dart';

part 'about_us.g.dart';

abstract class AboutUsEntity
    implements Built<AboutUsEntity, AboutUsEntityBuilder> {
  String get logo;
  String get name;
  String get detail;

  AboutUsEntity._();

  factory AboutUsEntity([updates(AboutUsEntityBuilder b)]) = _$AboutUsEntity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AboutUsEntity.serializer, this));
  }

  static AboutUsEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        AboutUsEntity.serializer, json.decode(jsonString));
  }

  static Serializer<AboutUsEntity> get serializer => _$aboutUsEntitySerializer;
}
