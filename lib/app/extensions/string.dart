import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension AppString on String {
  Text get text => Text(this);

  int? toInt() {
    try {
      return int.parse(this);
    } catch (e) {
      return null;
    }
  }

  bool isValidUrl() {
    return GetUtils.hasMatch(this, r"^((sms|mail|tel|http|https|ftp)://)?((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+$");
  }
}
