// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_page_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsPageEntity> _$newsPageEntitySerializer =
    new _$NewsPageEntitySerializer();

class _$NewsPageEntitySerializer
    implements StructuredSerializer<NewsPageEntity> {
  @override
  final Iterable<Type> types = const [NewsPageEntity, _$NewsPageEntity];
  @override
  final String wireName = 'NewsPageEntity';

  @override
  Iterable serialize(Serializers serializers, NewsPageEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];
    if (object.next != null) {
      result
        ..add('next')
        ..add(serializers.serialize(object.next,
            specifiedType: const FullType(String)));
    }
    if (object.previous != null) {
      result
        ..add('previous')
        ..add(serializers.serialize(object.previous,
            specifiedType: const FullType(String)));
    }
    if (object.results != null) {
      result
        ..add('results')
        ..add(serializers.serialize(object.results,
            specifiedType:
                const FullType(BuiltList, const [const FullType(NewsEntity)])));
    }

    return result;
  }

  @override
  NewsPageEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsPageEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previous':
          result.previous = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(NewsEntity)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsPageEntity extends NewsPageEntity {
  @override
  final int count;
  @override
  final String next;
  @override
  final String previous;
  @override
  final BuiltList<NewsEntity> results;

  factory _$NewsPageEntity([void updates(NewsPageEntityBuilder b)]) =>
      (new NewsPageEntityBuilder()..update(updates)).build();

  _$NewsPageEntity._({this.count, this.next, this.previous, this.results})
      : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('NewsPageEntity', 'count');
    }
  }

  @override
  NewsPageEntity rebuild(void updates(NewsPageEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsPageEntityBuilder toBuilder() =>
      new NewsPageEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsPageEntity &&
        count == other.count &&
        next == other.next &&
        previous == other.previous &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, count.hashCode), next.hashCode), previous.hashCode),
        results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsPageEntity')
          ..add('count', count)
          ..add('next', next)
          ..add('previous', previous)
          ..add('results', results))
        .toString();
  }
}

class NewsPageEntityBuilder
    implements Builder<NewsPageEntity, NewsPageEntityBuilder> {
  _$NewsPageEntity _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  String _next;
  String get next => _$this._next;
  set next(String next) => _$this._next = next;

  String _previous;
  String get previous => _$this._previous;
  set previous(String previous) => _$this._previous = previous;

  ListBuilder<NewsEntity> _results;
  ListBuilder<NewsEntity> get results =>
      _$this._results ??= new ListBuilder<NewsEntity>();
  set results(ListBuilder<NewsEntity> results) => _$this._results = results;

  NewsPageEntityBuilder();

  NewsPageEntityBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _next = _$v.next;
      _previous = _$v.previous;
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsPageEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsPageEntity;
  }

  @override
  void update(void updates(NewsPageEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsPageEntity build() {
    _$NewsPageEntity _$result;
    try {
      _$result = _$v ??
          new _$NewsPageEntity._(
              count: count,
              next: next,
              previous: previous,
              results: _results?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsPageEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
