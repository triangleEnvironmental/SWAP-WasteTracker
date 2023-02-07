import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/register/address/controllers/address_controller.dart';

class RegisterAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterAddressController>(() => RegisterAddressController());
  }
}
