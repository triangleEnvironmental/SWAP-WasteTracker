// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'citizen_area_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CitizenAreaInfo _$CitizenAreaInfoFromJson(Map<String, dynamic> json) {
  return _CitizenAreaInfo.fromJson(json);
}

/// @nodoc
mixin _$CitizenAreaInfo {
  @HiveField(0)
  List<Institution> get serviceProviders => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Institution> get municipalities => throw _privateConstructorUsedError;
  @HiveField(2)
  List<Area> get provinces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitizenAreaInfoCopyWith<CitizenAreaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitizenAreaInfoCopyWith<$Res> {
  factory $CitizenAreaInfoCopyWith(
          CitizenAreaInfo value, $Res Function(CitizenAreaInfo) then) =
      _$CitizenAreaInfoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<Institution> serviceProviders,
      @HiveField(1) List<Institution> municipalities,
      @HiveField(2) List<Area> provinces});
}

/// @nodoc
class _$CitizenAreaInfoCopyWithImpl<$Res>
    implements $CitizenAreaInfoCopyWith<$Res> {
  _$CitizenAreaInfoCopyWithImpl(this._value, this._then);

  final CitizenAreaInfo _value;
  // ignore: unused_field
  final $Res Function(CitizenAreaInfo) _then;

  @override
  $Res call({
    Object? serviceProviders = freezed,
    Object? municipalities = freezed,
    Object? provinces = freezed,
  }) {
    return _then(_value.copyWith(
      serviceProviders: serviceProviders == freezed
          ? _value.serviceProviders
          : serviceProviders // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      municipalities: municipalities == freezed
          ? _value.municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      provinces: provinces == freezed
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Area>,
    ));
  }
}

/// @nodoc
abstract class _$$_CitizenAreaInfoCopyWith<$Res>
    implements $CitizenAreaInfoCopyWith<$Res> {
  factory _$$_CitizenAreaInfoCopyWith(
          _$_CitizenAreaInfo value, $Res Function(_$_CitizenAreaInfo) then) =
      __$$_CitizenAreaInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<Institution> serviceProviders,
      @HiveField(1) List<Institution> municipalities,
      @HiveField(2) List<Area> provinces});
}

/// @nodoc
class __$$_CitizenAreaInfoCopyWithImpl<$Res>
    extends _$CitizenAreaInfoCopyWithImpl<$Res>
    implements _$$_CitizenAreaInfoCopyWith<$Res> {
  __$$_CitizenAreaInfoCopyWithImpl(
      _$_CitizenAreaInfo _value, $Res Function(_$_CitizenAreaInfo) _then)
      : super(_value, (v) => _then(v as _$_CitizenAreaInfo));

  @override
  _$_CitizenAreaInfo get _value => super._value as _$_CitizenAreaInfo;

  @override
  $Res call({
    Object? serviceProviders = freezed,
    Object? municipalities = freezed,
    Object? provinces = freezed,
  }) {
    return _then(_$_CitizenAreaInfo(
      serviceProviders: serviceProviders == freezed
          ? _value._serviceProviders
          : serviceProviders // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      municipalities: municipalities == freezed
          ? _value._municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      provinces: provinces == freezed
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Area>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CitizenAreaInfo extends _CitizenAreaInfo {
  _$_CitizenAreaInfo(
      {@HiveField(0) required final List<Institution> serviceProviders,
      @HiveField(1) required final List<Institution> municipalities,
      @HiveField(2) required final List<Area> provinces})
      : _serviceProviders = serviceProviders,
        _municipalities = municipalities,
        _provinces = provinces,
        super._();

  factory _$_CitizenAreaInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CitizenAreaInfoFromJson(json);

  final List<Institution> _serviceProviders;
  @override
  @HiveField(0)
  List<Institution> get serviceProviders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceProviders);
  }

  final List<Institution> _municipalities;
  @override
  @HiveField(1)
  List<Institution> get municipalities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_municipalities);
  }

  final List<Area> _provinces;
  @override
  @HiveField(2)
  List<Area> get provinces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  @override
  String toString() {
    return 'CitizenAreaInfo(serviceProviders: $serviceProviders, municipalities: $municipalities, provinces: $provinces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CitizenAreaInfo &&
            const DeepCollectionEquality()
                .equals(other._serviceProviders, _serviceProviders) &&
            const DeepCollectionEquality()
                .equals(other._municipalities, _municipalities) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceProviders),
      const DeepCollectionEquality().hash(_municipalities),
      const DeepCollectionEquality().hash(_provinces));

  @JsonKey(ignore: true)
  @override
  _$$_CitizenAreaInfoCopyWith<_$_CitizenAreaInfo> get copyWith =>
      __$$_CitizenAreaInfoCopyWithImpl<_$_CitizenAreaInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CitizenAreaInfoToJson(
      this,
    );
  }
}

abstract class _CitizenAreaInfo extends CitizenAreaInfo {
  factory _CitizenAreaInfo(
      {@HiveField(0) required final List<Institution> serviceProviders,
      @HiveField(1) required final List<Institution> municipalities,
      @HiveField(2) required final List<Area> provinces}) = _$_CitizenAreaInfo;
  _CitizenAreaInfo._() : super._();

  factory _CitizenAreaInfo.fromJson(Map<String, dynamic> json) =
      _$_CitizenAreaInfo.fromJson;

  @override
  @HiveField(0)
  List<Institution> get serviceProviders;
  @override
  @HiveField(1)
  List<Institution> get municipalities;
  @override
  @HiveField(2)
  List<Area> get provinces;
  @override
  @JsonKey(ignore: true)
  _$$_CitizenAreaInfoCopyWith<_$_CitizenAreaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
