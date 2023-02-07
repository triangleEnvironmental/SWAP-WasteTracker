
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/profile/controllers/profile_controller.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.authService.listenable,
      builder: (BuildContext context, Box<dynamic> authBox, Widget? child) {
        final user = controller.authService.user!;
        return KeyboardDismissable(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleKeys.title_profile,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (user.profilePhotoUrl != null) {
                          viewPhoto(
                            images: [NetworkImage(user.profilePhotoUrl!)],
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 3,
                          ),
                        ),
                        child: UserAvatar(
                          user.profilePhotoUrl ?? '',
                          name: user.fullName,
                        ).sized(120).circle,
                      ),
                    ),
                  ).paddingSymmetric(
                    vertical: 10,
                    horizontal: AppDimens.marginHorizontal,
                  ),
                  10.y,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: controller.updateProfilePhoto,
                        icon: const Icon(AppIcons.addPhoto),
                        label: Text(
                          LocaleKeys.button_upload,
                        ),
                      ),
                      if (user.profilePhotoPath != null)
                        FilledTonalButton(
                          color: AppColors.danger,
                          onPressed: controller.deleteProfilePhoto,
                          child: const Icon(AppIcons.delete),
                        ).marginOnly(left: 4),
                    ],
                  ),
                  20.y,
                  SectionTitle(
                    icon: AppIcons.personal,
                    label: LocaleKeys.label_personal_information,
                  ).m,
                  TextFormField(
                    controller: TextEditingController(text: user.firstName ?? ''),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_first_name,
                      label: Text(LocaleKeys.label_first_name),
                    ),
                    onTap: () {
                      controller.editName(controller.firstNameController);
                    },
                    readOnly: true,
                  ).m,
                  8.y,
                  TextFormField(
                    controller: TextEditingController(text: user.lastName ?? ''),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_last_name,
                      label: Text(LocaleKeys.label_last_name),
                    ),
                    onTap: () {
                      controller.editName(controller.lastNameController);
                    },
                    readOnly: true,
                  ).m,
                  8.y,
                  SectionTitle(
                    icon: AppIcons.address,
                    label: LocaleKeys.label_my_location,
                  ).m,
                  TextFormField(
                    controller: TextEditingController(text: user.address ?? LocaleKeys.label_tap_to_add_location),
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: null,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_my_address,
                      label: Text(LocaleKeys.input_my_address),
                      suffix: const Icon(AppIcons.mapPin),
                    ),
                    readOnly: true,
                    onTap: controller.updateLocation,
                  ).m,
                  8.y,
                  if (user.citizenAreaInfo != null) ...[
                    SectionTitle(
                      icon: AppIcons.serviceProvider,
                      label: LocaleKeys.label_service_provider,
                    ).m,
                    if (user.citizenAreaInfo!.serviceProviders.isNotEmpty)
                      Column(
                        children: [
                          for (final serviceProvider in user.citizenAreaInfo!.serviceProviders)
                            ListTile(
                              leading: serviceProvider.logo.sized(40).circle,
                              title: Text(serviceProvider.name),
                              trailing: SizedBox(
                                width: 100,
                                child: Flex(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  direction: Axis.horizontal,
                                  children: [
                                    for (Sector sector in serviceProvider.sectors ?? [])
                                      sector.icon.sized(20).circle.marginOnly(
                                            left: 2,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      )
                    else
                      Center(
                        child: Text(
                          LocaleKeys.phrase_no_service_provider_in_your_area,
                          style: const TextStyle(
                            color: AppColors.greyText,
                          ),
                        ).paddingSymmetric(
                          horizontal: AppDimens.marginHorizontal,
                          vertical: 20,
                        ),
                      ),

                    if (user.citizenAreaInfo!.municipalities.isNotEmpty) ...[
                      SectionTitle(
                        icon: AppIcons.municipality,
                        label: LocaleKeys.label_municipality,
                      ).m,
                      Column(
                        children: [
                          for (final serviceProvider in user.citizenAreaInfo!.municipalities)
                            ListTile(
                              leading: serviceProvider.logo.sized(40).circle,
                              title: Text(serviceProvider.name),
                              trailing: SizedBox(
                                width: 100,
                                child: Flex(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  direction: Axis.horizontal,
                                  children: [
                                    for (Sector sector in serviceProvider.sectors ?? [])
                                      sector.icon.sized(20).circle.marginOnly(
                                            left: 2,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                    // LabelValue(
                    //   title: LocaleKeys.label_province_city,
                    //   value: user.citizenAreaInfo!.provinces.first.name,
                    // ).m,
                    40.y,
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}