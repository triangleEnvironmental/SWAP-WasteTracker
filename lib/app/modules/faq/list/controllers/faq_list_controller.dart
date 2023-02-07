import 'package:get/get.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/services/index.dart';

class FaqListController extends GetxController {
  final informationService = Get.find<InformationService>();
  Rx<Sector?> activeSector = Rx(null);
  Rx<bool> serviceAvailable = true.obs;

  List<Sector>? get availableSectors => informationService.availableSectors.value;

  updateActiveSector() async {
    if (informationService.availableSectors.value != null) {
      if (informationService.availableSectors.value!.isNotEmpty) {
        activeSector.value = informationService.availableSectors.value!.first;
      } else {
        serviceAvailable.value = false;
      }
    }
  }

  @override
  void onInit() {
    updateActiveSector();
    informationService.availableSectors.addListener(updateActiveSector);
    super.onInit();
  }

  @override
  void onClose() {
    informationService.availableSectors.removeListener(updateActiveSector);
    super.onClose();
  }
}