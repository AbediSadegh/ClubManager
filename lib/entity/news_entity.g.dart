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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
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
  NewsEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
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

class _$NewsEntity extends NewsEntity {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final String image;
  @override
  final String content;
  @override
  final BuiltList<String> newsImages;

  factory _$NewsEntity([void updates(NewsEntityBuilder b)]) =>
      (new NewsEntityBuilder()..update(updates)).build();

  _$NewsEntity._(
      {this.id,
      this.url,
      this.title,
      this.image,
      this.content,
      this.newsImages})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'title');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'image');
    }
    if (content == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'content');
    }
    if (newsImages == null) {
      throw new BuiltValueNullFieldError('NewsEntity', 'newsImages');
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
        id == other.id &&
        url == other.url &&
        title == other.title &&
        image == other.image &&
        content == other.content &&
        newsImages == other.newsImages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), url.hashCode), title.hashCode),
                image.hashCode),
            content.hashCode),
        newsImages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsEntity')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('image', image)
          ..add('content', content)
          ..add('newsImages', newsImages))
        .toString();
  }
}

class NewsEntityBuilder implements Builder<NewsEntity, NewsEntityBuilder> {
  _$NewsEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  ListBuilder<String> _newsImages;
  ListBuilder<String> get newsImages =>
      _$this._newsImages ??= new ListBuilder<String>();
  set newsImages(ListBuilder<String> newsImages) =>
      _$this._newsImages = newsImages;

  NewsEntityBuilder();

  NewsEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _title = _$v.title;
      _image = _$v.image;
      _content = _$v.content;
      _newsImages = _$v.newsImages?.toBuilder();
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
    _$NewsEntity _$result;
    try {
      _$result = _$v ??
          new _$NewsEntity._(
              id: id,
              url: url,
              title: title,
              image: image,
              content: content,
              newsImages: newsImages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'newsImages';
        newsImages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
