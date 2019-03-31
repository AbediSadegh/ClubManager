// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsEntity> _$newsEntitySerializer = new _$NewsEntitySerializer();

class _$NewsEntitySerializer implements StructuredSerializer<NewsEntity> {
  @override
  final Iterable<Type> types = const [NewsEntity, _$NewsEntity];
  @override
  final String wireName = 'NewsEntity';

  @override
  Iterable serialize(Serializers serializers, NewsEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'imgURL',
      serializers.serialize(object.imgURL,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'shortDesc',
      serializers.serialize(object.shortDesc,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NewsEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'imgURL':
          result.imgURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shortDesc':
          result.shortDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsEntity extends NewsEntity {
  @override
  final String imgURL;
  @override
  final String title;
  @override
  final String description;
  @override
  final String shortDesc;

  factory _$NewsEntity([void updates(NewsEntityBuilder b)]) =>
      (new NewsEntityBuilder()..update(updates)).build();

  _$NewsEntity._({this.imgURL, this.title, this.description, this.shortDesc})
      : super._() {
    if (imgURL == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'imgURL');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'description');
    }
    if (shortDesc == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'shortDesc');
    }
  }

  @override
  NewsEntity rebuild(void updates(NewsEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsEntityBuilder toBuilder() => new NewsEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsEntity &&
        imgURL == other.imgURL &&
        title == other.title &&
        description == other.description &&
        shortDesc == other.shortDesc;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, imgURL.hashCode), title.hashCode), description.hashCode),
        shortDesc.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsEntity')
          ..add('imgURL', imgURL)
          ..add('title', title)
          ..add('description', description)
          ..add('shortDesc', shortDesc))
        .toString();
  }
}

class NewsEntityBuilder implements Builder<NewsEntity, NewsEntityBuilder> {
  _$NewsEntity _$v;

  String _imgURL;
  String get imgURL => _$this._imgURL;
  set imgURL(String imgURL) => _$this._imgURL = imgURL;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _shortDesc;
  String get shortDesc => _$this._shortDesc;
  set shortDesc(String shortDesc) => _$this._shortDesc = shortDesc;

  NewsEntityBuilder();

  NewsEntityBuilder get _$this {
    if (_$v != null) {
      _imgURL = _$v.imgURL;
      _title = _$v.title;
      _description = _$v.description;
      _shortDesc = _$v.shortDesc;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsEntity;
  }

  @override
  void update(void updates(NewsEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsEntity build() {
    final _$result = _$v ??
        new _$NewsEntity._(
            imgURL: imgURL,
            title: title,
            description: description,
            shortDesc: shortDesc);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
