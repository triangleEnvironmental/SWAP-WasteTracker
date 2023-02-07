import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/modules/phone_login/controllers/phone_login_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/locales/index.dart';

const waitSeconds = 120;

class OtpController extends GetxController {
  String _verificationId = Get.arguments?['verificationId'];
  final phone = Get.arguments?['phone'];
  int? _forceResendingToken = (Get.arguments?['forceResendingToken'] as String?)?.toInt();
  final authRepository = AuthRepository();
  final authService = Get.find<AuthService>();

  Rx<int> countDownSeconds = waitSeconds.obs;
  Rx<bool> failedToVerify = false.obs;

  PhoneLoginController phoneLoginController = Get.find<PhoneLoginController>();
  final TextEditingController textEditingController = TextEditingController();

  late Timer timer;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countDownSeconds.value = countDownSeconds.value - 1;
      if (countDownSeconds.value == 0 && timer.isActive) {
        timer.cancel();
      }
    });
    phoneLoginController.listenableSmsOtp.addListener(_onRetrieveSms);
    super.onInit();
  }

  @override
  void onClose() {
    if (timer.isActive) {
      timer.cancel();
    }
    phoneLoginController.listenableSmsOtp.removeListener(_onRetrieveSms);
    super.onClose();
  }

  _resetTimer() {
    countDownSeconds.value = waitSeconds;
    if (timer.isActive) {
      timer.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countDownSeconds.value = countDownSeconds.value - 1;
      if (countDownSeconds.value == 0 && timer.isActive) {
        timer.cancel();
      }
    });
  }

  _onRetrieveSms() {
    print("OTP subscription stream : ${phoneLoginController.listenableSmsOtp.value}");
    textEditingController.text = phoneLoginController.listenableSmsOtp.value;
  }

  Future onClaimDemoAccount(String phone, String otp) async {
    startLoading();
    final loginInfo = await authRepository.firebaseDemoLogin(phone, otp);
    stopLoading();

    if (loginInfo != null && !loginInfo.needRegister) {
      authService.setAuth(loginInfo.auth!);
      Get.offAllNamed(Routes.routeHome);
    }
    // else {
    //   alert(
    //     message: 'Failed to authenticate',
    //   );
    // }
  }

  void onClaimedIdToken(String idToken) async {
    startLoading();
    final loginInfo = await authRepository.firebaseLogin(idToken);
    stopLoading();

    if (loginInfo != null) {
      if (loginInfo.needRegister) {
        authService.idToken = idToken;
        Get.offAllNamed(Routes.routeRegisterUsername);
      } else {
        authService.setAuth(loginInfo.auth!);
        Get.offAllNamed(Routes.routeHome);
      }
    }
  }

  onCompleteCode(String otp) async {
    print(phone);
    if (phone.startsWith('+855190000')) {
      await onClaimDemoAccount(phone, otp);
      return;
    }

    String? idToken;
    try {
      startLoading();
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otp);
      await auth.signInWithCredential(credential);
      idToken = await auth.currentUser?.getIdToken();
    } catch (e) {
      alert(
        message: e.toString(),
      );
    } finally {
      stopLoading();
    }

    print('id token : $idToken');

    if (idToken != null) {
      onClaimedIdToken(idToken);
    }
  }

  retrySignIn() {
    Get.offNamedUntil(Routes.routePhoneLogin, (route) => route.settings.name == Routes.routePhoneLogin);
  }

  resendCode() async {
    FirebaseAuth auth = FirebaseAuth.instance;

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
          phoneLoginController.listenableSmsOtp.value = autoRetrievedCode;
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        stopLoading();
        _resetTimer();
        _verificationId = verificationId;
        _forceResendingToken = forceResendingToken;
        textEditingController.text = '';
      },
      verificationFailed: (FirebaseAuthException error) {
        stopLoading();
        failedToVerify.value = true;
        alert(
          message: LocaleKeys.alert_verification_failed,
        );
      },
      forceResendingToken: _forceResendingToken,
    );
  }
}
