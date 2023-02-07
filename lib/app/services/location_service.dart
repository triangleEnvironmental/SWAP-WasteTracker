import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:waste_tracker/app/enums/location_statuses.dart';
import 'package:waste_tracker/app/globals/location_picked_result.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/locales/index.dart';

class LocationService extends GetxService {
  Location location = Location();
  bool passCheckingStatus = false;
  LocationStatuses status = LocationStatuses.requesting;
  ValueNotifier<LocationWithAddress?> lastKnownLocation = ValueNotifier(null);
  Rx<bool> requestingLocation = false.obs;

  LocationWithAddress? get lastLatLng {
    return lastKnownLocation.value;
  }

  Future<LocationStatuses> requestPermission() async {
    passCheckingStatus = true;
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return LocationStatuses.gpsDisabled;
        }
      }
    } catch (e) {
      print(e);
      return LocationStatuses.gpsDisabled;
    }

    try {
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return LocationStatuses.permissionDenied;
        }
      }
    } catch (e) {
      print(e);
      return LocationStatuses.permissionDenied;
    }
    return LocationStatuses.okay;
  }

  Future<bool> requestGps() async {
    return await location.requestService();
  }

  Future<LocationService> init() async {
    status = await requestPermission();
    lastKnownLocation.addListener(() {
      print("Update available sector");
      try {
        final informationService = Get.find<InformationService>();
        informationService.fillAvailableSector();
      } catch (_) {}
    });
    return this;
  }

  Future<LocationWithAddress?> getCurrentLocation({
    bool fromLastKnownLocation = false,
  }) async {
    if (fromLastKnownLocation && lastKnownLocation.value != null) {
      return lastKnownLocation.value;
    }
    status = await requestPermission();
    if (status == LocationStatuses.okay) {
      return LocationWithAddress.fromLocationData(await location.getLocation());
    }
    return null;
  }

  Future updateUserLocation({bool checkTimeout = true}) async {
    final completer = Completer<LocationWithAddress?>();
    final timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {
        if (checkTimeout && !completer.isCompleted) {
          alert(message: LocaleKeys.error_process_taking_too_long);
          status = LocationStatuses.error;
          completer.complete(null);
        }
      },
    );

    getCurrentLocation().then((value) {
      if (!completer.isCompleted) {
        if (value != null) {
          lastKnownLocation.value = value;
          status = LocationStatuses.okay;
        } else {
          status = LocationStatuses.error;
          alert(message: LocaleKeys.error_failed_to_get_current_location);
        }
        if (checkTimeout && timer.isActive) {
          timer.cancel();
        }
        completer.complete(value);
      }
    });

    await completer.future;
  }

  goToLocationSetting() async {
    await permission_handler.openAppSettings();
  }

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      LocationData location = LocationData.fromMap({
        'latitude': latitude,
        'longitude': longitude,
      });
      if (location.latitude == null || location.longitude == null) {
        return null;
      }
      List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(location.latitude!, location.longitude!);

      var place = placemarks.first;
      return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    } catch (e) {
      return null;
    }
  }
}