import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/modules/register/address/controllers/address_controller.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class RegisterAddressView extends GetView<RegisterAddressController> {
  const RegisterAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title_your_address,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
          ),
          child: Column(
            children: [
              Image.asset(
                AppStrings.addressImage,
                width: Get.width / 2,
              ).marginSymmetric(
                vertical: 30,
              ),
              Text(
                LocaleKeys.phrase_address_is_important,
                textAlign: TextAlign.center,
              ),
              30.y,
              Obx(
                () => TextFormField(
                  controller: TextEditingController(
                    text: () {
                      if (controller.location.value == null) {
                        return LocaleKeys.label_tap_to_add_location;
                      } else {
                        if (controller.address.value != null) {
                          return controller.address.value;
                        } else {
                          return latLngToString(controller.location.value!);
                        }
                      }
                    }(),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: null,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_tap_to_add_location,
                    label: Text(LocaleKeys.input_my_address),
                    suffix: const Icon(AppIcons.mapPin),
                  ),
                  readOnly: true,
                  onTap: controller.updateLocation,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: BottomButton(
                onPressed: controller.onIgnore,
                buttonType: ButtonType.text,
                child: Text(
                  LocaleKeys.button_do_it_later,
                ),
              ),
            ),
            10.x,
            Expanded(
              child: Obx(
                () => BottomButton(
                  onPressed: controller.location.value == null || controller.address.value == null ? null : controller.onSubmit,
                  child: Text(LocaleKeys.button_finish),
                ),
              ),
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
