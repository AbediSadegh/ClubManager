// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_field_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsFieldEntity> _$newsFieldEntitySerializer =
    new _$NewsFieldEntitySerializer();

class _$NewsFieldEntitySerializer
    implements StructuredSerializer<NewsFieldEntity> {
  @override
  final Iterable<Type> types = const [NewsFieldEntity, _$NewsFieldEntity];
  @override
  final String wireName = 'NewsFieldEntity';

  @override
  Iterable serialize(Serializers serializers, NewsFieldEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'newsImages',
      serializers.serialize(object.newsImages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  NewsFieldEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsFieldEntityBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'newsImages':
          result.newsImages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsFieldEntity extends NewsFieldEntity {
  @override
  final String url;
  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final BuiltList<String> newsImages;

  factory _$NewsFieldEntity([void updates(NewsFieldEntityBuilder b)]) =>
      (new NewsFieldEntityBuilder()..update(updates)).build();

  _$NewsFieldEntity._(
      {this.url, this.id, this.title, this.content, this.newsImages})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('NewsFieldEntity', 'url');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('NewsFieldEntity', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsFieldEntity', 'title');
    }
    if (content == null) {
      throw new BuiltValueNullFieldError('NewsFieldEntity', 'content');
    }
    if (newsImages == null) {
      throw new BuiltValueNullFieldError('NewsFieldEntity', 'newsImages');
    }
  }

  @override
  NewsFieldEntity rebuild(void updates(NewsFieldEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsFieldEntityBuilder toBuilder() =>
      new NewsFieldEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsFieldEntity &&
        url == other.url &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        newsImages == other.newsImages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, url.hashCode), id.hashCode), title.hashCode),
            content.hashCode),
        newsImages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsFieldEntity')
          ..add('url', url)
          ..add('id', id)
          ..add('title', title)
          ..add('content', content)
          ..add('newsImages', newsImages))
        .toString();
  }
}

class NewsFieldEntityBuilder
    implements Builder<NewsFieldEntity, NewsFieldEntityBuilder> {
  _$NewsFieldEntity _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  ListBuilder<String> _newsImages;
  ListBuilder<String> get newsImages =>
      _$this._newsImages ??= new ListBuilder<String>();
  set newsImages(ListBuilder<String> newsImages) =>
      _$this._newsImages = newsImages;

  NewsFieldEntityBuilder();

  NewsFieldEntityBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _id = _$v.id;
      _title = _$v.title;
      _content = _$v.content;
      _newsImages = _$v.newsImages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsFieldEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsFieldEntity;
  }

  @override
  void update(void updates(NewsFieldEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsFieldEntity build() {
    _$NewsFieldEntity _$result;
    try {
      _$result = _$v ??
          new _$NewsFieldEntity._(
              url: url,
              id: id,
              title: title,
              content: content,
              newsImages: newsImages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'newsImages';
        newsImages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsFieldEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
