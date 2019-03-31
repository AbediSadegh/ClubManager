// GENERATED CODE - DO NOT MODIFY BY HAND

part of photograph;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Photograph> _$photographSerializer = new _$PhotographSerializer();

class _$PhotographSerializer implements StructuredSerializer<Photograph> {
  @override
  final Iterable<Type> types = const [Photograph, _$Photograph];
  @override
  final String wireName = 'Photograph';

  @override
  Iterable serialize(Serializers serializers, Photograph object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'photo',
      serializers.serialize(object.photo,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'isVideo',
      serializers.serialize(object.isVideo,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Photograph deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotographBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isVideo':
          result.isVideo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Photograph extends Photograph {
  @override
  final String thumbnail;
  @override
  final String photo;
  @override
  final String description;
  @override
  final bool isVideo;

  factory _$Photograph([void updates(PhotographBuilder b)]) =>
      (new PhotographBuilder()..update(updates)).build();

  _$Photograph._({this.thumbnail, this.photo, this.description, this.isVideo})
      : super._() {
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Photograph', 'thumbnail');
    }
    if (photo == null) {
      throw new BuiltValueNullFieldError('Photograph', 'photo');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Photograph', 'description');
    }
    if (isVideo == null) {
      throw new BuiltValueNullFieldError('Photograph', 'isVideo');
    }
  }

  @override
  Photograph rebuild(void updates(PhotographBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotographBuilder toBuilder() => new PhotographBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Photograph &&
        thumbnail == other.thumbnail &&
        photo == other.photo &&
        description == other.description &&
        isVideo == other.isVideo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, thumbnail.hashCode), photo.hashCode),
            description.hashCode),
        isVideo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Photograph')
          ..add('thumbnail', thumbnail)
          ..add('photo', photo)
          ..add('description', description)
          ..add('isVideo', isVideo))
        .toString();
  }
}

class PhotographBuilder implements Builder<Photograph, PhotographBuilder> {
  _$Photograph _$v;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _isVideo;
  bool get isVideo => _$this._isVideo;
  set isVideo(bool isVideo) => _$this._isVideo = isVideo;

  PhotographBuilder();

  PhotographBuilder get _$this {
    if (_$v != null) {
      _thumbnail = _$v.thumbnail;
      _photo = _$v.photo;
      _description = _$v.description;
      _isVideo = _$v.isVideo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Photograph other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Photograph;
  }

  @override
  void update(void updates(PhotographBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Photograph build() {
    final _$result = _$v ??
        new _$Photograph._(
            thumbnail: thumbnail,
            photo: photo,
            description: description,
            isVideo: isVideo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
