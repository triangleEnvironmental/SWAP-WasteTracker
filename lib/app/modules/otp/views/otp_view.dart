
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: AppDimens.marginHorizontal.ph,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LimitedBox(
                maxHeight: 200,
                child: Image.asset(AppStrings.appGraphicImage),
              ),
              RichText(
                textScaleFactor: Get.mediaQuery.textScaleFactor,
                text: TextSpan(
                  style: Get.textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: LocaleKeys.phrase_otp_send_to,
                    ),
                    TextSpan(
                      text: controller.phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ).marginOnly(
                top: 20,
                bottom: 40,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: AppDimens.borderRadiusSm,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  borderWidth: 3,
                  selectedColor: AppColors.primaryColor,
                  selectedFillColor: AppColors.primaryColor.withOpacity(0.5),
                  activeColor: AppColors.primaryColor,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.transparent,
                  inactiveFillColor: AppColors.primaryColor.withOpacity(0.5),
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: controller.textEditingController,
                onCompleted: (String otp) {
                  controller.onCompleteCode(otp);
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: Get.context!,
              ).marginSymmetric(
                horizontal: 20,
              ),
              Obx(
                () {
                  if (controller.failedToVerify.value) {
                    return TextButton(
                      onPressed: controller.retrySignIn,
                      child: Text(
                        LocaleKeys.button_retry_sign_in,
                      ),
                    );
                  }
                  return controller.countDownSeconds.value == 0
                      ? TextButton(
                          onPressed: controller.resendCode,
                          child: Text(
                            LocaleKeys.button_resend,
                          ),
                        )
                      : TextButton(
                          onPressed: null,
                          child: Text(
                            '${LocaleKeys.button_resend} (${controller.countDownSeconds.value})',
                          ),
                        );
                },
              ),
              60.y,
              // if (isDebug && Platform.isIOS)
              //   FilledButton(
              //     onPressed: () {
              //       controller.onClaimedIdToken(
              //           'eyJhbGciOiJSUzI1NiIsImtpZCI6IjUyZmEwZjE2NmJmZjZiODU5N2FjMGFlMDRlNTllZmYxOTk1N2MyYmIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZGV2LXN3YXAtZTliYWYiLCJhdWQiOiJkZXYtc3dhcC1lOWJhZiIsImF1dGhfdGltZSI6MTY2MjMxOTI1OSwidXNlcl9pZCI6IjhERXJqSmlTcW5Qc005bDZwUEZjWk5YT0t6WjIiLCJzdWIiOiI4REVyakppU3FuUHNNOWw2cFBGY1pOWE9LeloyIiwiaWF0IjoxNjYyMzE5MjU5LCJleHAiOjE2NjIzMjI4NTksInBob25lX251bWJlciI6Iis4NTUxNzg4NjAwOCIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzg1NTE3ODg2MDA4Il19LCJzaWduX2luX3Byb3ZpZGVyIjoicGhvbmUifX0.rk7O8HG_AFtAvUQ-34n45MaRMuCdX8CU2Xni-mXEDJI9_6C7rkyYFdf3cLzN0q7jPSTUJxCos6x4vu1Sv7l3e5epRehnpe5zr7YI7dAQqmI6Yf07eALvX5mEO7FIv78bY9S_GfjYYCM_Bf-n88Z-np4-T3ku9AIYzs_mGiu8ESn9S_bo4AS4Fcvgo8UZICiRol94ypqzUBA-RLKbwoParkQivx4Wi6tf0ja5VF6hiXNHnqO4LeQ4MpOrWubHGEDdy0bNmZxvDRFxrQzuhRXdIaoXWUna9I-DnQtrFpNS4kyliIlMxKyOP3WKqQBl36JkhyM0k2BnVjcZVibd9_cF6w');
              //     },
              //     child: const Text(
              //       "To Test Account",
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}