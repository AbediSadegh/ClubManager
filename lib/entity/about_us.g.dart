// GENERATED CODE - DO NOT MODIFY BY HAND

part of about_us;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AboutUsEntity> _$aboutUsEntitySerializer =
    new _$AboutUsEntitySerializer();

class _$AboutUsEntitySerializer implements StructuredSerializer<AboutUsEntity> {
  @override
  final Iterable<Type> types = const [AboutUsEntity, _$AboutUsEntity];
  @override
  final String wireName = 'AboutUsEntity';

  @override
  Iterable serialize(Serializers serializers, AboutUsEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'logo',
      serializers.serialize(object.logo, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'detail',
      serializers.serialize(object.detail,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AboutUsEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AboutUsEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AboutUsEntity extends AboutUsEntity {
  @override
  final String logo;
  @override
  final String name;
  @override
  final String detail;

  factory _$AboutUsEntity([void updates(AboutUsEntityBuilder b)]) =>
      (new AboutUsEntityBuilder()..update(updates)).build();

  _$AboutUsEntity._({this.logo, this.name, this.detail}) : super._() {
    if (logo == null) {
      throw new BuiltValueNullFieldError('AboutUsEntity', 'logo');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('AboutUsEntity', 'name');
    }
    if (detail == null) {
      throw new BuiltValueNullFieldError('AboutUsEntity', 'detail');
    }
  }

  @override
  AboutUsEntity rebuild(void updates(AboutUsEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AboutUsEntityBuilder toBuilder() => new AboutUsEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AboutUsEntity &&
        logo == other.logo &&
        name == other.name &&
        detail == other.detail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, logo.hashCode), name.hashCode), detail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AboutUsEntity')
          ..add('logo', logo)
          ..add('name', name)
          ..add('detail', detail))
        .toString();
  }
}

class AboutUsEntityBuilder
    implements Builder<AboutUsEntity, AboutUsEntityBuilder> {
  _$AboutUsEntity _$v;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  AboutUsEntityBuilder();

  AboutUsEntityBuilder get _$this {
    if (_$v != null) {
      _logo = _$v.logo;
      _name = _$v.name;
      _detail = _$v.detail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AboutUsEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AboutUsEntity;
  }

  @override
  void update(void updates(AboutUsEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AboutUsEntity build() {
    final _$result =
        _$v ?? new _$AboutUsEntity._(logo: logo, name: name, detail: detail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
