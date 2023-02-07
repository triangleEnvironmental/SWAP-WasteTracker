import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/report/create_report/controllers/create_report_controller.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ReportCreateView extends GetView<ReportCreateController> {
  const ReportCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title_new_report,
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionTitle(
                    icon: AppIcons.mapPin,
                    label: LocaleKeys.label_report_location,
                  ).m,
                  CustomFormField(
                    child: Material(
                      borderRadius: AppDimens.borderRadiusMd,
                      child: InkWell(
                        borderRadius: AppDimens.borderRadiusMd,
                        onTap: controller.changeLocation,
                        child: Container(
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lineColor),
                            borderRadius: AppDimens.borderRadiusMd,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: controller.location.value.text(),
                                ),
                                const Icon(
                                  AppIcons.marker,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).m,
                  20.y,
                  CustomFormField(
                    validator: (_) {
                      if (controller.images.isEmpty) {
                        return LocaleKeys.validate_we_need_some_images;
                      }
                      return null;
                    },
                    child: Material(
                      color: AppColors.primaryColor,
                      borderRadius: AppDimens.borderRadiusLg,
                      child: InkWell(
                        onTap: controller.addPhoto,
                        borderRadius: AppDimens.borderRadiusLg,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                AppIcons.addPhoto,
                                size: 50,
                                color: AppColors.contrastTextColor,
                              ),
                              10.y,
                              Text(
                                LocaleKeys.button_add_photos,
                                style: Get.textTheme.headline6?.copyWith(
                                  color: AppColors.contrastTextColor,
                                ),
                              ),
                            ],
                          ),
                        ).paddingSymmetric(
                          vertical: 20,
                        ),
                      ),
                    ),
                  ).m,
                  20.y,
                  Grid(
                    crossAxisCount: 3,
                    children: [
                      for (File imageFile in controller.images)
                        Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: AppDimens.borderRadiusSm,
                                child: FadeInImage(
                                  image: FileImage(imageFile),
                                  placeholder: const AssetImage(AppStrings.reportImagePlaceholder),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.images.remove(imageFile);
                                  },
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox.square(
                                    dimension: 25,
                                    child: FittedBox(
                                      child: const Icon(
                                        AppIcons.delete,
                                        color: AppColors.danger,
                                      ).paddingAll(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ).m,
                  SectionTitle(
                    icon: AppIcons.description,
                    label: LocaleKeys.label_description,
                  ).m,
                  TextFormField(
                    controller: controller.descriptionController,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return LocaleKeys.validate_report_description;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(LocaleKeys.input_description),
                      hintText: LocaleKeys.input_description,
                    ),
                  ).m,
                  20.y,
                  SectionTitle(
                    icon: AppIcons.reportType,
                    label: LocaleKeys.label_report_type,
                  ).m,
                  for (ReportType reportType in controller.sector.reportTypes ?? [])
                    RadioListTile<ReportType>(
                      groupValue: controller.reportType.value,
                      value: reportType,
                      onChanged: (selectedType) {
                        controller.reportType.value = selectedType;
                      },
                      title: Text(
                        reportType.name,
                      ),
                    ),
                  if (controller.authService.isLoggedIn)
                    SectionTitle(
                      icon: AppIcons.anonymous,
                      label: LocaleKeys.label_report_anonymously,
                      trailing: Switch(
                        onChanged: (bool value) {
                          controller.anonymous.value = value;
                        },
                        value: controller.anonymous.value,
                      ),
                    ).m,
                  40.y,
                  BottomButton(
                    onPressed: controller.onSubmit,
                    child: Text(LocaleKeys.button_submit),
                  ).m,
                  40.y,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}