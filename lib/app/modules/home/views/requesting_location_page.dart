import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class RequestingLocationPage extends StatelessWidget {
  const RequestingLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorView(
      image: Image.asset(AppStrings.errorGpsImage),
      title: LocaleKeys.title_please_wait,
      description: LocaleKeys.phrase_requesting_location,
      bottom: Center(
        child: const LoadingWidget().paddingSymmetric(
          vertical: 20,
        ),
      ),
      action: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 4),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final homeController = Get.find<HomeController>();
            return FilledButton(
              onPressed: () {
                homeController.selectLocationManually(noGps: true);
              },
              child: Text(LocaleKeys.label_find_another_way),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
