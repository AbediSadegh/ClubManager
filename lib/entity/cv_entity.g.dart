// GENERATED CODE - DO NOT MODIFY BY HAND

part of cv_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CVEntity> _$cVEntitySerializer = new _$CVEntitySerializer();

class _$CVEntitySerializer implements StructuredSerializer<CVEntity> {
  @override
  final Iterable<Type> types = const [CVEntity, _$CVEntity];
  @override
  final String wireName = 'CVEntity';

  @override
  Iterable serialize(Serializers serializers, CVEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'license',
      serializers.serialize(object.license,
          specifiedType: const FullType(String)),
      'education',
      serializers.serialize(object.education,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CVEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CVEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'license':
          result.license = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'education':
          result.education = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CVEntity extends CVEntity {
  @override
  final String name;
  @override
  final String license;
  @override
  final String education;
  @override
  final String description;

  factory _$CVEntity([void updates(CVEntityBuilder b)]) =>
      (new CVEntityBuilder()..update(updates)).build();

  _$CVEntity._({this.name, this.license, this.education, this.description})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('CVEntity', 'name');
    }
    if (license == null) {
      throw new BuiltValueNullFieldError('CVEntity', 'license');
    }
    if (education == null) {
      throw new BuiltValueNullFieldError('CVEntity', 'education');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('CVEntity', 'description');
    }
  }

  @override
  CVEntity rebuild(void updates(CVEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CVEntityBuilder toBuilder() => new CVEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CVEntity &&
        name == other.name &&
        license == other.license &&
        education == other.education &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), license.hashCode), education.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CVEntity')
          ..add('name', name)
          ..add('license', license)
          ..add('education', education)
          ..add('description', description))
        .toString();
  }
}

class CVEntityBuilder implements Builder<CVEntity, CVEntityBuilder> {
  _$CVEntity _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _license;
  String get license => _$this._license;
  set license(String license) => _$this._license = license;

  String _education;
  String get education => _$this._education;
  set education(String education) => _$this._education = education;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  CVEntityBuilder();

  CVEntityBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _license = _$v.license;
      _education = _$v.education;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CVEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CVEntity;
  }

  @override
  void update(void updates(CVEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CVEntity build() {
    final _$result = _$v ??
        new _$CVEntity._(
            name: name,
            license: license,
            education: education,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
