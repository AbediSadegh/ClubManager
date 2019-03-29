library cv_entity;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:club_manager/entity/serializers.dart';

part 'cv_entity.g.dart';

abstract class CVEntity implements Built<CVEntity, CVEntityBuilder> {
  String get name;
  String get license;
  String get education;
  String get description;
  String get imgURL;

  CVEntity._();

  factory CVEntity([updates(CVEntityBuilder b)]) = _$CVEntity;

  String toJson() {
    return json.encode(serializers.serializeWith(CVEntity.serializer, this));
  }

  static CVEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        CVEntity.serializer, json.decode(jsonString));
  }

  static Serializer<CVEntity> get serializer => _$cVEntitySerializer;
}
