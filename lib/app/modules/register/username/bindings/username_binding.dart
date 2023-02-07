import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/register/username/controllers/username_controller.dart';

class RegisterUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUsernameController>(() => RegisterUsernameController());
  }
}
