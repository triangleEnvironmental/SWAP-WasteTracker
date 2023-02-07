// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faq_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FaqCategory _$FaqCategoryFromJson(Map<String, dynamic> json) {
  return _FaqCategory.fromJson(json);
}

/// @nodoc
mixin _$FaqCategory {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaqCategoryCopyWith<FaqCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryCopyWith<$Res> {
  factory $FaqCategoryCopyWith(
          FaqCategory value, $Res Function(FaqCategory) then) =
      _$FaqCategoryCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm});
}

/// @nodoc
class _$FaqCategoryCopyWithImpl<$Res> implements $FaqCategoryCopyWith<$Res> {
  _$FaqCategoryCopyWithImpl(this._value, this._then);

  final FaqCategory _value;
  // ignore: unused_field
  final $Res Function(FaqCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FaqCategoryCopyWith<$Res>
    implements $FaqCategoryCopyWith<$Res> {
  factory _$$_FaqCategoryCopyWith(
          _$_FaqCategory value, $Res Function(_$_FaqCategory) then) =
      __$$_FaqCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm});
}

/// @nodoc
class __$$_FaqCategoryCopyWithImpl<$Res> extends _$FaqCategoryCopyWithImpl<$Res>
    implements _$$_FaqCategoryCopyWith<$Res> {
  __$$_FaqCategoryCopyWithImpl(
      _$_FaqCategory _value, $Res Function(_$_FaqCategory) _then)
      : super(_value, (v) => _then(v as _$_FaqCategory));

  @override
  _$_FaqCategory get _value => super._value as _$_FaqCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
  }) {
    return _then(_$_FaqCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FaqCategory extends _FaqCategory {
  _$_FaqCategory(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm})
      : super._();

  factory _$_FaqCategory.fromJson(Map<String, dynamic> json) =>
      _$$_FaqCategoryFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String nameEn;
  @override
  @HiveField(2)
  final String? nameKm;

  @override
  String toString() {
    return 'FaqCategory(id: $id, nameEn: $nameEn, nameKm: $nameKm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaqCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.nameKm, nameKm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nameEn),
      const DeepCollectionEquality().hash(nameKm));

  @JsonKey(ignore: true)
  @override
  _$$_FaqCategoryCopyWith<_$_FaqCategory> get copyWith =>
      __$$_FaqCategoryCopyWithImpl<_$_FaqCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FaqCategoryToJson(
      this,
    );
  }
}

abstract class _FaqCategory extends FaqCategory {
  factory _FaqCategory(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm}) = _$_FaqCategory;
  _FaqCategory._() : super._();

  factory _FaqCategory.fromJson(Map<String, dynamic> json) =
      _$_FaqCategory.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get nameEn;
  @override
  @HiveField(2)
  String? get nameKm;
  @override
  @JsonKey(ignore: true)
  _$$_FaqCategoryCopyWith<_$_FaqCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
