import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';

class RegisterUsernameController extends GetxController {
  final authRepository = AuthRepository();
  final authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();

  onSubmit() async {
    if ((formKey.currentState?.validate() ?? false) && authService.idToken != null) {
      startLoading();
      final result = await authRepository.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        idToken: authService.idToken!,
      );
      stopLoading();

      if (result != null) {
        authService.setAuth(result);
        Get.offAllNamed(Routes.routeRegisterAddress);
      }
    }
  }
}