import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth.dart';

part 'login_info.freezed.dart';
part 'login_info.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class LoginInfo with _$LoginInfo {
  const LoginInfo._();

  factory LoginInfo({
    required bool needRegister,
    Auth? auth,
  }) = _LoginInfo;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => _$LoginInfoFromJson(json);
}
