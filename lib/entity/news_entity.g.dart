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
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'subtitle',
      serializers.serialize(object.subtitle,
          specifiedType: const FullType(String)),
    ];
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }

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
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsEntity extends NewsEntity {
  @override
  final String url;
  @override
  final String title;
  @override
  final String image;
  @override
  final String subtitle;

  factory _$NewsEntity([void updates(NewsEntityBuilder b)]) =>
      (new NewsEntityBuilder()..update(updates)).build();

  _$NewsEntity._({this.url, this.title, this.image, this.subtitle})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'title');
    }
    if (subtitle == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'subtitle');
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
        url == other.url &&
        title == other.title &&
        image == other.image &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, url.hashCode), title.hashCode), image.hashCode),
        subtitle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsEntity')
          ..add('url', url)
          ..add('title', title)
          ..add('image', image)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class NewsEntityBuilder implements Builder<NewsEntity, NewsEntityBuilder> {
  _$NewsEntity _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _subtitle;
  String get subtitle => _$this._subtitle;
  set subtitle(String subtitle) => _$this._subtitle = subtitle;

  NewsEntityBuilder();

  NewsEntityBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _title = _$v.title;
      _image = _$v.image;
      _subtitle = _$v.subtitle;
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
            url: url, title: title, image: image, subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
