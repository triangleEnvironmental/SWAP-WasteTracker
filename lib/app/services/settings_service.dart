import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/constants/index.dart';

class SettingsService extends GetxService {
  late bool _isDarkMode;
  late String _localeSetting;
  late Box _settingBox;

  Brightness get brightness => _isDarkMode ? Brightness.dark : Brightness.light;
  Locale get locale => Locale(_localeSetting.split('_')[0], _localeSetting.split('_')[1]);

  Future<SettingsService> init() async {
    _settingBox = await Hive.openBox(AppStrings.settingBox);
    _isDarkMode = _settingBox.get('isDarkMode') ?? false;
    _localeSetting = _settingBox.get('locale') ?? '${AppValues.fallbackLocale.languageCode}_${AppValues.fallbackLocale.countryCode}';
    return this;
  }

  updateLocale(Locale newLocale) async {
    _localeSetting = '${newLocale.languageCode}_${newLocale.countryCode}';
    _settingBox.put('locale', _localeSetting);
  }

  updateBrightness(Brightness newBrightness) async {
    _isDarkMode = newBrightness == Brightness.dark;
    _settingBox.put('isDarkMode', _isDarkMode);
  }
}
