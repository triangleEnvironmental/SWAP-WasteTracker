import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  const PhoneLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                10.y,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      openChangeLanguage();
                    },
                    icon: currentLocaleIcon,
                    label: Text(currentLocaleText),
                  ),
                ),
                LimitedBox(
                  maxHeight: 180,
                  child: Image.asset(AppStrings.appGraphicImage),
                ),
                Text(
                  LocaleKeys.phrase_enter_phone,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge,
                ).marginOnly(
                  top: 20,
                  bottom: 20,
                ),
                Obx(
                  () => PhoneFormField(
                    key: controller.phoneFormKey,
                    controller: controller.phoneController,
                    shouldFormat: true,
                    defaultCountry: IsoCode.KH,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.label_phone_number,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.onSubmitPhoneNumber();
                        },
                        child: const Icon(AppIcons.phone),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: controller.phoneValidation.value,
                    isCountryChipPersistent: false,
                    isCountrySelectionEnabled: true,
                    countrySelectorNavigator: const CountrySelectorNavigator.draggableBottomSheet(
                      favorites: [IsoCode.KH, IsoCode.US],
                    ),
                    showFlagInInput: true,
                    flagSize: 16,
                    autofillHints: const [
                      AutofillHints.telephoneNumber,
                    ],
                    enabled: true,
                    // autofocus: true,
                    onSaved: (PhoneNumber? p) {},
                    onSubmitted: (_) {
                      controller.onSubmitPhoneNumber();
                    },
                    onChanged: (PhoneNumber? p) async {
                      if (controller.errorValidation.value) {
                        controller.phoneValidation.value = PhoneValidator.none;
                        await Future.delayed(const Duration(milliseconds: 200));
                        controller.phoneFormKey.currentState?.validate();
                        controller.resetPhoneValidation();
                        controller.errorValidation.value = false;
                      }
                    },
                  ),
                ),
                20.y,
                BottomButton(
                  onPressed: controller.onSubmitPhoneNumber,
                  child: Text(
                    LocaleKeys.button_get_verification_code,
                  ),
                ),
                TextButton(
                  onPressed: controller.continueWithoutLogin,
                  child: Text(
                    LocaleKeys.button_continue_without_log_in,
                  ),
                ),
                20.y,
                RichText(
                  textScaleFactor: Get.textScaleFactor,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Get.textTheme.bodyText2,
                    children: [
                      TextSpan(
                        text: '${LocaleKeys.phrase_using_app_accept}\n',
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.routeTerms);
                          },
                          child: Text(
                            LocaleKeys.title_terms_of_use,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' ${LocaleKeys.label_and} ',
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.routePolicies);
                          },
                          child: Text(
                            LocaleKeys.title_privacy_policy,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                60.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
