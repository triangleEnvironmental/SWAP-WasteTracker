
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/locales/index.dart';

class PhoneLoginController extends GetxController {
  final GlobalKey<PhoneFormFieldState> phoneFormKey = GlobalKey();
  Rx<bool> errorValidation = false.obs;
  Rx<PhoneNumberInputValidator> phoneValidation = PhoneValidator.none.obs;

  resetPhoneValidation() {
    phoneValidation.value = PhoneValidator.compose(
      [
        PhoneValidator.required(
          errorText: LocaleKeys.validate_phone_required,
        ),
        PhoneValidator.validMobile(
          errorText: LocaleKeys.validate_phone_number_is_invalid,
        ),
      ],
    );
  }

  final PhoneController phoneController = PhoneController(
    const PhoneNumber(
      isoCode: IsoCode.KH,
      nsn: '',
    ),
  );

  final ValueNotifier<String> listenableSmsOtp = ValueNotifier('');

  @override
  void onInit() {
    resetPhoneValidation();
    super.onInit();
  }

  String? get phone {
    if (phoneController.value != null) {
      return '+${phoneController.value!.countryCode}${phoneController.value!.nsn}';
    }
    return null;
  }

  goToOtpScreen(String verificationId, int? forceResendingToken) async {
    await Get.toNamed(
      Routes.routeOtp,
      arguments: {
        'verificationId': verificationId,
        'forceResendingToken': forceResendingToken != null ? '$forceResendingToken' : '',
        'phone': phone,
      },
    );
  }

  continueWithoutLogin() async {
    Get.offAllNamed(Routes.routeHome);
  }

  onSubmitPhoneNumber() async {
    if (phoneFormKey.currentState == null) {
      return;
    }

    if (phoneFormKey.currentState!.validate()) {
      errorValidation.value = false;

      FirebaseAuth auth = FirebaseAuth.instance;
      auth.setLanguageCode(Get.locale?.languageCode);

      startLoading();

      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          print("No longer wait to auto detect SMS code");
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          final autoRetrievedCode = phoneAuthCredential.smsCode;
          if (autoRetrievedCode != null) {
            listenableSmsOtp.value = autoRetrievedCode;
          }
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          stopLoading();
          await goToOtpScreen(verificationId, forceResendingToken);
        },
        verificationFailed: (FirebaseAuthException error) {
          stopLoading();
          print(error);
          alert(
            message: LocaleKeys.alert_verification_failed,
          );
        },
      );
    } else {
      errorValidation.value = true;
    }
  }
}
