// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportStatus _$ReportStatusFromJson(Map<String, dynamic> json) {
  return _ReportStatus.fromJson(json);
}

/// @nodoc
mixin _$ReportStatus {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get color => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportStatusCopyWith<ReportStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStatusCopyWith<$Res> {
  factory $ReportStatusCopyWith(
          ReportStatus value, $Res Function(ReportStatus) then) =
      _$ReportStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? color,
      @HiveField(4) String? key});
}

/// @nodoc
class _$ReportStatusCopyWithImpl<$Res> implements $ReportStatusCopyWith<$Res> {
  _$ReportStatusCopyWithImpl(this._value, this._then);

  final ReportStatus _value;
  // ignore: unused_field
  final $Res Function(ReportStatus) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? color = freezed,
    Object? key = freezed,
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
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportStatusCopyWith<$Res>
    implements $ReportStatusCopyWith<$Res> {
  factory _$$_ReportStatusCopyWith(
          _$_ReportStatus value, $Res Function(_$_ReportStatus) then) =
      __$$_ReportStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? color,
      @HiveField(4) String? key});
}

/// @nodoc
class __$$_ReportStatusCopyWithImpl<$Res>
    extends _$ReportStatusCopyWithImpl<$Res>
    implements _$$_ReportStatusCopyWith<$Res> {
  __$$_ReportStatusCopyWithImpl(
      _$_ReportStatus _value, $Res Function(_$_ReportStatus) _then)
      : super(_value, (v) => _then(v as _$_ReportStatus));

  @override
  _$_ReportStatus get _value => super._value as _$_ReportStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? color = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_ReportStatus(
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
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportStatus extends _ReportStatus {
  _$_ReportStatus(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm,
      @HiveField(3) this.color,
      @HiveField(4) this.key})
      : super._();

  factory _$_ReportStatus.fromJson(Map<String, dynamic> json) =>
      _$$_ReportStatusFromJson(json);

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
  @HiveField(3)
  final String? color;
  @override
  @HiveField(4)
  final String? key;

  @override
  String toString() {
    return 'ReportStatus(id: $id, nameEn: $nameEn, nameKm: $nameKm, color: $color, key: $key)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ReportStatusCopyWith<_$_ReportStatus> get copyWith =>
      __$$_ReportStatusCopyWithImpl<_$_ReportStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportStatusToJson(
      this,
    );
  }
}

abstract class _ReportStatus extends ReportStatus {
  factory _ReportStatus(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm,
      @HiveField(3) final String? color,
      @HiveField(4) final String? key}) = _$_ReportStatus;
  _ReportStatus._() : super._();

  factory _ReportStatus.fromJson(Map<String, dynamic> json) =
      _$_ReportStatus.fromJson;

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
  @HiveField(3)
  String? get color;
  @override
  @HiveField(4)
  String? get key;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStatusCopyWith<_$_ReportStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
