// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  return _LoginInfo.fromJson(json);
}

/// @nodoc
mixin _$LoginInfo {
  bool get needRegister => throw _privateConstructorUsedError;
  Auth? get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginInfoCopyWith<LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInfoCopyWith<$Res> {
  factory $LoginInfoCopyWith(LoginInfo value, $Res Function(LoginInfo) then) =
      _$LoginInfoCopyWithImpl<$Res>;
  $Res call({bool needRegister, Auth? auth});

  $AuthCopyWith<$Res>? get auth;
}

/// @nodoc
class _$LoginInfoCopyWithImpl<$Res> implements $LoginInfoCopyWith<$Res> {
  _$LoginInfoCopyWithImpl(this._value, this._then);

  final LoginInfo _value;
  // ignore: unused_field
  final $Res Function(LoginInfo) _then;

  @override
  $Res call({
    Object? needRegister = freezed,
    Object? auth = freezed,
  }) {
    return _then(_value.copyWith(
      needRegister: needRegister == freezed
          ? _value.needRegister
          : needRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as Auth?,
    ));
  }

  @override
  $AuthCopyWith<$Res>? get auth {
    if (_value.auth == null) {
      return null;
    }

    return $AuthCopyWith<$Res>(_value.auth!, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginInfoCopyWith<$Res> implements $LoginInfoCopyWith<$Res> {
  factory _$$_LoginInfoCopyWith(
          _$_LoginInfo value, $Res Function(_$_LoginInfo) then) =
      __$$_LoginInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool needRegister, Auth? auth});

  @override
  $AuthCopyWith<$Res>? get auth;
}

/// @nodoc
class __$$_LoginInfoCopyWithImpl<$Res> extends _$LoginInfoCopyWithImpl<$Res>
    implements _$$_LoginInfoCopyWith<$Res> {
  __$$_LoginInfoCopyWithImpl(
      _$_LoginInfo _value, $Res Function(_$_LoginInfo) _then)
      : super(_value, (v) => _then(v as _$_LoginInfo));

  @override
  _$_LoginInfo get _value => super._value as _$_LoginInfo;

  @override
  $Res call({
    Object? needRegister = freezed,
    Object? auth = freezed,
  }) {
    return _then(_$_LoginInfo(
      needRegister: needRegister == freezed
          ? _value.needRegister
          : needRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as Auth?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginInfo extends _LoginInfo {
  _$_LoginInfo({required this.needRegister, this.auth}) : super._();

  factory _$_LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$$_LoginInfoFromJson(json);

  @override
  final bool needRegister;
  @override
  final Auth? auth;

  @override
  String toString() {
    return 'LoginInfo(needRegister: $needRegister, auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInfo &&
            const DeepCollectionEquality()
                .equals(other.needRegister, needRegister) &&
            const DeepCollectionEquality().equals(other.auth, auth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(needRegister),
      const DeepCollectionEquality().hash(auth));

  @JsonKey(ignore: true)
  @override
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      __$$_LoginInfoCopyWithImpl<_$_LoginInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginInfoToJson(
      this,
    );
  }
}

abstract class _LoginInfo extends LoginInfo {
  factory _LoginInfo({required final bool needRegister, final Auth? auth}) =
      _$_LoginInfo;
  _LoginInfo._() : super._();

  factory _LoginInfo.fromJson(Map<String, dynamic> json) =
      _$_LoginInfo.fromJson;

  @override
  bool get needRegister;
  @override
  Auth? get auth;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
