import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/modules/register/username/controllers/username_controller.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class RegisterUsernameView extends GetView<RegisterUsernameController> {
  const RegisterUsernameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        bottomNavigationBar: BottomButton(
          onPressed: controller.onSubmit,
          child: Text(
            LocaleKeys.button_submit,
          ),
        ).paddingAll(10),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: CurveHeader.preferredHeight,
                  child: CurveHeader(
                    title: Image.asset(
                      AppStrings.horizontalLogoImage,
                    ),
                  ),
                ),
                20.y,
                Text(
                  LocaleKeys.phrase_tell_us_your_name_,
                  style: Get.textTheme.headline6,
                ).paddingSymmetric(
                  horizontal: AppDimens.marginHorizontal,
                ),
                32.y,
                TextFormField(
                  controller: controller.firstNameController,
                  focusNode: controller.firstNameFocusNode,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_first_name,
                  ),
                  validator: Validation.require(LocaleKeys.label_first_name),
                ).paddingSymmetric(
                  horizontal: AppDimens.marginHorizontal,
                ),
                16.y,
                TextFormField(
                  controller: controller.lastNameController,
                  focusNode: controller.lastNameFocusNode,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_last_name,
                  ),
                  onFieldSubmitted: (_) {
                    controller.onSubmit();
                  },
                ).paddingSymmetric(
                  horizontal: AppDimens.marginHorizontal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}