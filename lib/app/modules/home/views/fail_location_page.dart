import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class FailLocationPage extends StatelessWidget {
  const FailLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorView(
      image: Image.asset(AppStrings.errorImage),
      title: LocaleKeys.title_failed_to_get_current_location,
      description: LocaleKeys.phrase_unknown_error_location,
      action: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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