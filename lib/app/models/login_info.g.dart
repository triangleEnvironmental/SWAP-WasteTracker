// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginInfo _$$_LoginInfoFromJson(Map json) => _$_LoginInfo(
      needRegister: json['need_register'] as bool,
      auth: json['auth'] == null
          ? null
          : Auth.fromJson(Map<String, dynamic>.from(json['auth'] as Map)),
    );

Map<String, dynamic> _$$_LoginInfoToJson(_$_LoginInfo instance) =>
    <String, dynamic>{
      'need_register': instance.needRegister,
      'auth': instance.auth?.toJson(),
    };
