import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class PermissionDeniedPage extends StatelessWidget {
  const PermissionDeniedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorView(
      image: Image.asset(AppStrings.permissionDeniedImage),
      title: LocaleKeys.title_location_permission_denied,
      description: LocaleKeys.phrase_location_permission_denied,
      action: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: () {
              final locationService = Get.find<LocationService>();
              locationService.goToLocationSetting();
            },
            child: Text(LocaleKeys.button_open_app_settings),
          ),
          Builder(
            builder: (context) {
              try {
                final homeController = Get.find<HomeController>();
                return ElevatedButton(
                  onPressed: homeController.selectLocationManually,
                  child: Text(LocaleKeys.label_find_another_way),
                );
              } catch (e) {
                return ElevatedButton(
                  onPressed: () {
                    Restart.restartApp();
                  },
                  child: Text(LocaleKeys.button_restart_app),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
