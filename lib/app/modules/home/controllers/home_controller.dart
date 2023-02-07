import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/globals/location_picked_result.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/home/views/home_page.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/locales/index.dart';

class HomeController extends GetxController {
  LocationService locationService = Get.find<LocationService>();
  InformationService informationService = Get.find<InformationService>();
  AuthService authService = Get.find<AuthService>();
  GlobalKey<HomePageState>? homepageKey;

  reloadHomePageData() {
    homepageKey?.currentState?.retry();
  }

  selectLocationManually({bool noGps = false}) async {
    Get.bottomSheet(
      Material(
        borderRadius: const BorderRadius.vertical(
          top: AppDimens.radiusSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.y,
            // if (locationService.status != LocationStatuses.gpsDisabled)
            if (!noGps)
              ListTile(
                onTap: () async {
                  Get.back();
                  startLoading();
                  try {
                    await locationService.updateUserLocation();
                  } catch (e) {
                    alert(message: e.toString());
                  }
                  stopLoading();
                },
                leading: const Icon(
                  AppIcons.refresh,
                  color: AppColors.green,
                ),
                title: Text(LocaleKeys.label_refresh_current_location),
              ),
            const Divider(height: 1),
            if (authService.user != null && authService.user!.location != null) ...[
              ListTile(
                onTap: () {
                  Get.back();
                  locationService.lastKnownLocation.value = LocationWithAddress.fromPoint(authService.user!.location!);
                },
                leading: const Icon(
                  AppIcons.address,
                  color: AppColors.red,
                ),
                title: Text(LocaleKeys.label_use_my_address),
              ),
              const Divider(height: 1),
            ],
            ListTile(
              onTap: () async {
                Get.back();
                final result = await pickLocation(
                  initialLocation: locationService.lastKnownLocation.value != null
                      ? LatLng(
                          locationService.lastKnownLocation.value!.latitude,
                          locationService.lastKnownLocation.value!.longitude,
                        )
                      : null,
                );
                if (result is LocationWithAddress) {
                  locationService.lastKnownLocation.value = result;
                }
              },
              leading: const Icon(
                AppIcons.gps,
                color: AppColors.blue,
              ),
              title: Text(LocaleKeys.label_select_location_manually),
            ),
            20.y,
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusSm,
        ),
      ),
    );
  }
}
