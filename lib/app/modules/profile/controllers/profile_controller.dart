import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ProfileController extends GetxController /*with GetTickerProviderStateMixin*/ {
  final authService = Get.find<AuthService>();
  final authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  deleteProfilePhoto() async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.label_delete_profile_photo,
      content: LocaleKeys.phrase_delete_profile_photo,
    );

    if (confirm) {
      startLoading();
      final result = await authRepository.updateProfilePhoto(null);
      stopLoading();
      if (result is User) {
        authService.setUser(result);
      }
    }
  }

  updateProfilePhoto() async {
    final photo = await pickPhoto();
    if (photo != null) {
      startLoading();
      final result = await authRepository.updateProfilePhoto(photo);
      stopLoading();
      if (result is User) {
        authService.setUser(result);
      }
    }
  }

  updateLocation() async {
    final location = await pickLocation(
      initialLocation: authService.user?.latLng,
      needAddress: true,
    );
    if (location is LocationWithAddress) {
      startLoading();
      location.address ??= await reverseGeocode(location.location);
      final response = await authRepository.updateAddress(
        location: location.location,
        address: location.address!,
      );
      stopLoading();
      if (response is User) {
        authService.setUser(response);

        try {
          Get.find<HomeController>().reloadHomePageData();
        } catch (e) {
          print('Fail to update homepage after change address');
          print(e);
        }
      }
    }
  }

  editName(TextEditingController clickedTextFieldController) async {
    if (Get.context == null) {
      return null;
    }

    firstNameController.text = authService.user?.firstName ?? '';
    lastNameController.text = authService.user?.lastName ?? '';

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusLg,
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
            vertical: 10,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SectionTitle(
                        icon: AppIcons.personal,
                        label: LocaleKeys.label_personal_information,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: firstNameController,
                      builder: (context, TextEditingValue firstNameInput, _) {
                        return ValueListenableBuilder(
                          valueListenable: lastNameController,
                          builder: (context, TextEditingValue lastNameInput, _) {
                            if (firstNameInput.text.trim() != authService.user?.firstName || lastNameInput.text.trim() != authService.user?.lastName) {
                              return FilledButton(
                                onPressed: submitName,
                                child: Text(
                                  LocaleKeys.button_submit,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                TextFormField(
                  controller: firstNameController,
                  textCapitalization: TextCapitalization.words,
                  autofocus: clickedTextFieldController == firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_first_name,
                    label: Text(LocaleKeys.label_first_name),
                  ),
                  validator: Validation.require(LocaleKeys.label_first_name),
                ).marginOnly(bottom: 8),
                TextFormField(
                  controller: lastNameController,
                  textCapitalization: TextCapitalization.words,
                  autofocus: clickedTextFieldController == lastNameController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_last_name,
                    label: Text(LocaleKeys.label_last_name),
                  ),
                  validator: Validation.require(LocaleKeys.label_last_name),
                ).marginOnly(bottom: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submitName() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      final result = await authRepository.updateName(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
      );
      stopLoading();
      if (result is User) {
        authService.setUser(result);
        Get.back(
          closeOverlays: false,
        );
      }
    }
  }

  @override
  void onInit() {
    authService.updateUser();
    firstNameController = TextEditingController(text: authService.user?.firstName ?? '');
    lastNameController = TextEditingController(text: authService.user?.lastName ?? '');
    super.onInit();
  }
}
