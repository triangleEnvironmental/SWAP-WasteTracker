// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'moderation_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModerationHistory _$ModerationHistoryFromJson(Map<String, dynamic> json) {
  return _ModerationHistory.fromJson(json);
}

/// @nodoc
mixin _$ModerationHistory {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get profile => throw _privateConstructorUsedError;
  @HiveField(2)
  Nameable? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get action => throw _privateConstructorUsedError;
  @HiveField(4)
  ReportStatus? get oldStatus => throw _privateConstructorUsedError;
  @HiveField(5)
  ReportStatus? get newStatus => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModerationHistoryCopyWith<ModerationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModerationHistoryCopyWith<$Res> {
  factory $ModerationHistoryCopyWith(
          ModerationHistory value, $Res Function(ModerationHistory) then) =
      _$ModerationHistoryCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? profile,
      @HiveField(2) Nameable? name,
      @HiveField(3) String? action,
      @HiveField(4) ReportStatus? oldStatus,
      @HiveField(5) ReportStatus? newStatus,
      @HiveField(6) DateTime? date});

  $NameableCopyWith<$Res>? get name;
  $ReportStatusCopyWith<$Res>? get oldStatus;
  $ReportStatusCopyWith<$Res>? get newStatus;
}

/// @nodoc
class _$ModerationHistoryCopyWithImpl<$Res>
    implements $ModerationHistoryCopyWith<$Res> {
  _$ModerationHistoryCopyWithImpl(this._value, this._then);

  final ModerationHistory _value;
  // ignore: unused_field
  final $Res Function(ModerationHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
    Object? name = freezed,
    Object? action = freezed,
    Object? oldStatus = freezed,
    Object? newStatus = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Nameable?,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      oldStatus: oldStatus == freezed
          ? _value.oldStatus
          : oldStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      newStatus: newStatus == freezed
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $NameableCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $NameableCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value));
    });
  }

  @override
  $ReportStatusCopyWith<$Res>? get oldStatus {
    if (_value.oldStatus == null) {
      return null;
    }

    return $ReportStatusCopyWith<$Res>(_value.oldStatus!, (value) {
      return _then(_value.copyWith(oldStatus: value));
    });
  }

  @override
  $ReportStatusCopyWith<$Res>? get newStatus {
    if (_value.newStatus == null) {
      return null;
    }

    return $ReportStatusCopyWith<$Res>(_value.newStatus!, (value) {
      return _then(_value.copyWith(newStatus: value));
    });
  }
}

/// @nodoc
abstract class _$$_ModerationHistoryCopyWith<$Res>
    implements $ModerationHistoryCopyWith<$Res> {
  factory _$$_ModerationHistoryCopyWith(_$_ModerationHistory value,
          $Res Function(_$_ModerationHistory) then) =
      __$$_ModerationHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? profile,
      @HiveField(2) Nameable? name,
      @HiveField(3) String? action,
      @HiveField(4) ReportStatus? oldStatus,
      @HiveField(5) ReportStatus? newStatus,
      @HiveField(6) DateTime? date});

  @override
  $NameableCopyWith<$Res>? get name;
  @override
  $ReportStatusCopyWith<$Res>? get oldStatus;
  @override
  $ReportStatusCopyWith<$Res>? get newStatus;
}

/// @nodoc
class __$$_ModerationHistoryCopyWithImpl<$Res>
    extends _$ModerationHistoryCopyWithImpl<$Res>
    implements _$$_ModerationHistoryCopyWith<$Res> {
  __$$_ModerationHistoryCopyWithImpl(
      _$_ModerationHistory _value, $Res Function(_$_ModerationHistory) _then)
      : super(_value, (v) => _then(v as _$_ModerationHistory));

  @override
  _$_ModerationHistory get _value => super._value as _$_ModerationHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
    Object? name = freezed,
    Object? action = freezed,
    Object? oldStatus = freezed,
    Object? newStatus = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ModerationHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Nameable?,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      oldStatus: oldStatus == freezed
          ? _value.oldStatus
          : oldStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      newStatus: newStatus == freezed
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModerationHistory extends _ModerationHistory {
  _$_ModerationHistory(
      {@HiveField(0) this.id,
      @HiveField(1) this.profile,
      @HiveField(2) this.name,
      @HiveField(3) this.action,
      @HiveField(4) this.oldStatus,
      @HiveField(5) this.newStatus,
      @HiveField(6) this.date})
      : super._();

  factory _$_ModerationHistory.fromJson(Map<String, dynamic> json) =>
      _$$_ModerationHistoryFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? profile;
  @override
  @HiveField(2)
  final Nameable? name;
  @override
  @HiveField(3)
  final String? action;
  @override
  @HiveField(4)
  final ReportStatus? oldStatus;
  @override
  @HiveField(5)
  final ReportStatus? newStatus;
  @override
  @HiveField(6)
  final DateTime? date;

  @override
  String toString() {
    return 'ModerationHistory(id: $id, profile: $profile, name: $name, action: $action, oldStatus: $oldStatus, newStatus: $newStatus, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModerationHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality().equals(other.oldStatus, oldStatus) &&
            const DeepCollectionEquality().equals(other.newStatus, newStatus) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(oldStatus),
      const DeepCollectionEquality().hash(newStatus),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ModerationHistoryCopyWith<_$_ModerationHistory> get copyWith =>
      __$$_ModerationHistoryCopyWithImpl<_$_ModerationHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModerationHistoryToJson(
      this,
    );
  }
}

abstract class _ModerationHistory extends ModerationHistory {
  factory _ModerationHistory(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? profile,
      @HiveField(2) final Nameable? name,
      @HiveField(3) final String? action,
      @HiveField(4) final ReportStatus? oldStatus,
      @HiveField(5) final ReportStatus? newStatus,
      @HiveField(6) final DateTime? date}) = _$_ModerationHistory;
  _ModerationHistory._() : super._();

  factory _ModerationHistory.fromJson(Map<String, dynamic> json) =
      _$_ModerationHistory.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get profile;
  @override
  @HiveField(2)
  Nameable? get name;
  @override
  @HiveField(3)
  String? get action;
  @override
  @HiveField(4)
  ReportStatus? get oldStatus;
  @override
  @HiveField(5)
  ReportStatus? get newStatus;
  @override
  @HiveField(6)
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$_ModerationHistoryCopyWith<_$_ModerationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
