import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/locales/index.dart';

class SettingsController extends GetxController {
  final settingsService = Get.find<SettingsService>();
  final authService = Get.find<AuthService>();
  final authRepository = AuthRepository();

  login() async {
    Get.toNamed(Routes.routePhoneLogin);
  }

  changeBrightness() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      settingsService.updateBrightness(Brightness.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      settingsService.updateBrightness(Brightness.dark);
    }
  }

  onEditProfile() {
    // Get.toNamed(Routes.routeRegisterAddress);
    Get.toNamed(Routes.routeProfile);
  }

  onLogOut() async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.label_log_out,
      content: LocaleKeys.phrase_log_out,
    );

    if (confirm) {
      authRepository.logout();
      authService.clear();
      revokeFcmToken();
      Get.offAllNamed(Routes.routePhoneLogin);
    }
  }
}