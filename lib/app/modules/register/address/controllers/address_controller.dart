import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';

class RegisterAddressController extends GetxController {
  final locationService = Get.find<LocationService>();
  final authService = Get.find<AuthService>();
  final authRepository = AuthRepository();

  Rx<LatLng?> location = Rx(null);
  Rx<String?> address = Rx(null);

  updateLocation() async {
    final pickedLocation = await pickLocation(
      initialLocation: location.value,
      needAddress: true,
    );

    if (pickedLocation is LocationWithAddress) {
      location.value = pickedLocation.location;
      if (pickedLocation.address != null) {
        address.value = pickedLocation.address;
      } else {
        address.value = latLngToString(location.value!);
        address.value = await reverseGeocode(location.value!);
      }
    }
  }

  setUserLocationOnInitial() async {
    final tmpLocation = await locationService.getCurrentLocation(
      fromLastKnownLocation: true,
    );
    if (tmpLocation == null) {
      return;
    }

    var tmpAddress = await reverseGeocode(LatLng(tmpLocation.latitude, tmpLocation.longitude));

    if (location.value == null) {
      location.value = LatLng(tmpLocation.latitude, tmpLocation.longitude);
      address.value = tmpAddress;
    }
  }

  onSubmit() async {
    startLoading();
    final response = await authRepository.updateAddress(
      location: location.value!,
      address: address.value!,
    );
    stopLoading();
    if (response is User) {
      authService.setUser(response);
      Get.offAllNamed(Routes.routeHome);
    }
  }

  onIgnore() async {
    Get.offAllNamed(Routes.routeHome);
  }

  @override
  void onInit() {
    setUserLocationOnInitial();
    super.onInit();
  }
}