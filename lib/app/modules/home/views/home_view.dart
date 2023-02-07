import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/enums/location_statuses.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/globals/location_picked_result.dart';
import 'package:waste_tracker/app/modules/home/views/gps_disabled_page.dart';
import 'package:waste_tracker/app/modules/home/views/permission_denied_page.dart';
import 'package:waste_tracker/app/modules/home/views/requesting_location_page.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

import '../controllers/home_controller.dart';
import 'fail_location_page.dart';
import 'home_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      routeName: Routes.routeHome,
      child: KeyboardDismissable(
        child: ValueListenableBuilder(
          valueListenable: controller.locationService.lastKnownLocation,
          builder: (context, LocationWithAddress? position, Widget? child) {
            var locationService = Get.find<LocationService>();
            return ValueListenableBuilder(
              valueListenable: controller.authService.listenable,
              builder: (context, _, __) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight + 10),
                    child: AppBar(
                      elevation: 0,
                      title: GestureDetector(
                        onTap: controller.selectLocationManually,
                        child: Material(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.locationService.lastLatLng != null) ...[
                                RichText(
                                  textScaleFactor: Get.textScaleFactor,
                                  text: TextSpan(
                                    style: Get.textTheme.bodyText2?.copyWith(
                                      fontSize: 14,
                                      color: AppColors.greyText,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: LocaleKeys.label_your_location,
                                      ),
                                      const WidgetSpan(
                                        baseline: TextBaseline.alphabetic,
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(
                                          AppIcons.down,
                                          size: 16,
                                          color: AppColors.greyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      AppIcons.location,
                                      size: 18,
                                      color: AppColors.red,
                                    ),
                                    2.x,
                                    Expanded(
                                      child: controller.locationService.lastLatLng!.text(
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ValueListenableBuilder(
                          valueListenable: controller.authService.listenable,
                          builder: (BuildContext context, Box<dynamic> authBox, Widget? child) {
                            if (controller.authService.user != null) {
                              return IconButton(
                                onPressed: () async {
                                  Get.toNamed(Routes.routeNotificationList);
                                },
                                tooltip: LocaleKeys.label_notifications,
                                icon: ValueListenableBuilder(
                                  valueListenable: controller.informationService.unreadNotificationCount,
                                  builder: (BuildContext context, int? value, Widget? child) => Badge(
                                    padding: const EdgeInsets.all(4),
                                    showBadge: value != null && value > 0,
                                    badgeContent: Text(
                                      '$value',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    child: const Icon(AppIcons.notification),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.routeSettings);
                          },
                          tooltip: LocaleKeys.tooltip_settings,
                          icon: const Icon(AppIcons.profile),
                        ),
                      ],
                      centerTitle: false,
                    ),
                  ),
                  body: Builder(
                    builder: (context) {
                      if (position != null) {
                        controller.homepageKey = GlobalObjectKey(position);
                        return HomePage(
                          key: controller.homepageKey!,
                          position: position,
                        );
                      } else {
                        if (locationService.status == LocationStatuses.requesting || locationService.status == LocationStatuses.okay) {
                          if (locationService.status == LocationStatuses.okay) {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              locationService.updateUserLocation(checkTimeout: false);
                            });
                          }
                          return const RequestingLocationPage();
                        } else if (locationService.status == LocationStatuses.gpsDisabled) {
                          return const GpsDisabledPage();
                        } else if (locationService.status == LocationStatuses.permissionDenied) {
                          return const PermissionDeniedPage();
                        } else {
                          return const FailLocationPage();
                        }
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
