import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/colors.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/faq/list/views/faq_list_page.dart';
import 'package:waste_tracker/app/modules/home/views/requesting_location_page.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

import '../controllers/faq_list_controller.dart';

class FaqListView extends GetView<FaqListController> {
  const FaqListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locationService = Get.find<LocationService>();
    return Theme(
      data: Get.theme.copyWith(
        indicatorColor: AppColors.primaryColor,
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.primaryColor,
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: locationService.lastKnownLocation,
        builder: (context, LocationWithAddress? position, Widget? child) {
          final title = Text(LocaleKeys.title_clean_city_tips);
          // While location service is loading
          if (position != null) {
            return Obx(
              () {
                // If already have an active sector
                if (controller.activeSector.value != null) {
                  // If available sector only 1, no need to show tab
                  if (controller.availableSectors!.length >= 2) {
                    List<Sector> availableSectors = controller.availableSectors!;
                    return DefaultTabController(
                      length: controller.availableSectors!.length,
                      child: Scaffold(
                        appBar: AppBar(
                          title: title,
                          bottom: TabBar(
                            tabs: availableSectors
                                .map(
                                  (e) => Tab(
                                    icon: UserAvatar(e.iconUrl).sized(30),
                                    text: e.name,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        body: TabBarView(
                          children: availableSectors
                              .map(
                                (e) => FaqListPage(sector: e),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  } else {
                    return Scaffold(
                      appBar: AppBar(
                        title: title,
                      ),
                      body: FaqListPage(
                        sector: controller.activeSector.value!,
                      ),
                    );
                  }
                } else {
                  if (controller.availableSectors == null) {
                    return Scaffold(
                      appBar: AppBar(
                        title: title,
                      ),
                      body: const Center(
                        child: LoadingWidget(),
                      ),
                    );
                  } else {
                    return Scaffold(
                      appBar: AppBar(
                        title: title,
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            16.y,
                            Image.asset(
                              AppStrings.noServiceImage,
                              width: Get.width,
                            ),
                            16.y,
                            Text(
                              LocaleKeys.label_service_not_available,
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headline6,
                            ),
                          ],
                        ).m,
                      ),
                    );
                  }
                }
              },
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: title,
              ),
              body: const RequestingLocationPage(),
            );
          }
        },
      ),
    );
  }
}