// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return _Faq.fromJson(json);
}

/// @nodoc
mixin _$Faq {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get questionEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get questionKm => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get answerEn => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get answerKm => throw _privateConstructorUsedError;
  @HiveField(5)
  Sector? get sector => throw _privateConstructorUsedError;
  @HiveField(6)
  List<FaqCategory>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaqCopyWith<Faq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) then) =
      _$FaqCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String questionEn,
      @HiveField(2) String? questionKm,
      @HiveField(3) String? answerEn,
      @HiveField(4) String? answerKm,
      @HiveField(5) Sector? sector,
      @HiveField(6) List<FaqCategory>? categories});

  $SectorCopyWith<$Res>? get sector;
}

/// @nodoc
class _$FaqCopyWithImpl<$Res> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._value, this._then);

  final Faq _value;
  // ignore: unused_field
  final $Res Function(Faq) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionEn = freezed,
    Object? questionKm = freezed,
    Object? answerEn = freezed,
    Object? answerKm = freezed,
    Object? sector = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionEn: questionEn == freezed
          ? _value.questionEn
          : questionEn // ignore: cast_nullable_to_non_nullable
              as String,
      questionKm: questionKm == freezed
          ? _value.questionKm
          : questionKm // ignore: cast_nullable_to_non_nullable
              as String?,
      answerEn: answerEn == freezed
          ? _value.answerEn
          : answerEn // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKm: answerKm == freezed
          ? _value.answerKm
          : answerKm // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: sector == freezed
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as Sector?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FaqCategory>?,
    ));
  }

  @override
  $SectorCopyWith<$Res>? get sector {
    if (_value.sector == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sector!, (value) {
      return _then(_value.copyWith(sector: value));
    });
  }
}

/// @nodoc
abstract class _$$_FaqCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$$_FaqCopyWith(_$_Faq value, $Res Function(_$_Faq) then) =
      __$$_FaqCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String questionEn,
      @HiveField(2) String? questionKm,
      @HiveField(3) String? answerEn,
      @HiveField(4) String? answerKm,
      @HiveField(5) Sector? sector,
      @HiveField(6) List<FaqCategory>? categories});

  @override
  $SectorCopyWith<$Res>? get sector;
}

/// @nodoc
class __$$_FaqCopyWithImpl<$Res> extends _$FaqCopyWithImpl<$Res>
    implements _$$_FaqCopyWith<$Res> {
  __$$_FaqCopyWithImpl(_$_Faq _value, $Res Function(_$_Faq) _then)
      : super(_value, (v) => _then(v as _$_Faq));

  @override
  _$_Faq get _value => super._value as _$_Faq;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionEn = freezed,
    Object? questionKm = freezed,
    Object? answerEn = freezed,
    Object? answerKm = freezed,
    Object? sector = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$_Faq(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionEn: questionEn == freezed
          ? _value.questionEn
          : questionEn // ignore: cast_nullable_to_non_nullable
              as String,
      questionKm: questionKm == freezed
          ? _value.questionKm
          : questionKm // ignore: cast_nullable_to_non_nullable
              as String?,
      answerEn: answerEn == freezed
          ? _value.answerEn
          : answerEn // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKm: answerKm == freezed
          ? _value.answerKm
          : answerKm // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: sector == freezed
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as Sector?,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FaqCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Faq extends _Faq {
  _$_Faq(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.questionEn,
      @HiveField(2) this.questionKm,
      @HiveField(3) this.answerEn,
      @HiveField(4) this.answerKm,
      @HiveField(5) this.sector,
      @HiveField(6) final List<FaqCategory>? categories})
      : _categories = categories,
        super._();

  factory _$_Faq.fromJson(Map<String, dynamic> json) => _$$_FaqFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String questionEn;
  @override
  @HiveField(2)
  final String? questionKm;
  @override
  @HiveField(3)
  final String? answerEn;
  @override
  @HiveField(4)
  final String? answerKm;
  @override
  @HiveField(5)
  final Sector? sector;
  final List<FaqCategory>? _categories;
  @override
  @HiveField(6)
  List<FaqCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Faq(id: $id, questionEn: $questionEn, questionKm: $questionKm, answerEn: $answerEn, answerKm: $answerKm, sector: $sector, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Faq &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.questionEn, questionEn) &&
            const DeepCollectionEquality()
                .equals(other.questionKm, questionKm) &&
            const DeepCollectionEquality().equals(other.answerEn, answerEn) &&
            const DeepCollectionEquality().equals(other.answerKm, answerKm) &&
            const DeepCollectionEquality().equals(other.sector, sector) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(questionEn),
      const DeepCollectionEquality().hash(questionKm),
      const DeepCollectionEquality().hash(answerEn),
      const DeepCollectionEquality().hash(answerKm),
      const DeepCollectionEquality().hash(sector),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_FaqCopyWith<_$_Faq> get copyWith =>
      __$$_FaqCopyWithImpl<_$_Faq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FaqToJson(
      this,
    );
  }
}

abstract class _Faq extends Faq {
  factory _Faq(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String questionEn,
      @HiveField(2) final String? questionKm,
      @HiveField(3) final String? answerEn,
      @HiveField(4) final String? answerKm,
      @HiveField(5) final Sector? sector,
      @HiveField(6) final List<FaqCategory>? categories}) = _$_Faq;
  _Faq._() : super._();

  factory _Faq.fromJson(Map<String, dynamic> json) = _$_Faq.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get questionEn;
  @override
  @HiveField(2)
  String? get questionKm;
  @override
  @HiveField(3)
  String? get answerEn;
  @override
  @HiveField(4)
  String? get answerKm;
  @override
  @HiveField(5)
  Sector? get sector;
  @override
  @HiveField(6)
  List<FaqCategory>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$_FaqCopyWith<_$_Faq> get copyWith => throw _privateConstructorUsedError;
}
