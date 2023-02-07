import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ReportCreateController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final authService = Get.find<AuthService>();
  final locationService = Get.find<LocationService>();
  final ReportRepository reportRepository = ReportRepository();

  late Rx<LocationWithAddress> location;
  final TextEditingController descriptionController = TextEditingController();
  RxList<File> images = RxList();
  final Sector sector = Get.arguments?['sector'];
  Rx<ReportType?> reportType = Rx(null);
  Rx<bool> anonymous = false.obs;

  openSuccessDialog(Report? report) async {
    await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                AppIcons.reportSuccess,
                size: 40,
                color: AppColors.success,
              ),
              const SizedBox(height: 10),
              Text(
                LocaleKeys.phrase_report_success,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: () {
                    Get.until(
                      (route) => (route.settings.name == Routes.routeHome),
                    );
                    // Get.offNamedUntil(page, (route) => false)
                  },
                  child: Text(
                    LocaleKeys.button_home_page,
                  ),
                ),
                if (report != null)
                  FilledButton(
                    onPressed: () {
                      Get.back(closeOverlays: false);
                      Get.offAndToNamed(
                        Routes.routeReportDetail,
                        arguments: {
                          'id': report.id,
                        },
                      );
                    },
                    color: AppColors.info,
                    child: Text(
                      LocaleKeys.button_view_report,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  onSubmit() async {
    final indicator = ValueNotifier(0.0);
    // startLoading(
    //   indicator: indicator,
    // );
    //
    // var timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
    //   indicator.value += 0.05;
    //   if (indicator.value >= 1) {
    //     timer.cancel();
    //   }
    // });
    // await Future.delayed(Duration(seconds: 4));
    //
    // stopLoading();
    //
    // return;
    if (formKey.currentState?.validate() ?? false) {
      startLoading(
        indicator: indicator,
      );
      final result = await reportRepository.createReport(
        location: location.value,
        images: images,
        description: descriptionController.text.trim(),
        reportType: reportType.value,
        isAnonymous: authService.isLoggedIn ? anonymous.value : true,
        indicator: indicator,
      );
      stopLoading();
      if (result is Report) {
        openSuccessDialog(result);
      }
    }
  }

  changeLocation() async {
    final result = await pickLocation(
      initialLocation: location.value.location,
    );
    print(result?.address);
    if (result is LocationWithAddress) {
      location.value = result;
    }
  }

  addPhoto() async {
    final result = await pickPhotos();
    if (result != null) {
      images.addAll(result);
    }
  }

  @override
  void onInit() {
    location = locationService.lastLatLng!.obs;
    if (sector.reportTypes != null) {
      reportType.value = sector.reportTypes!.first;
    }
    super.onInit();
  }
}
