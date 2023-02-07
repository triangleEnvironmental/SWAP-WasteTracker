import 'package:get/get.dart';

import '../controllers/faq_list_controller.dart';

class FaqListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqListController>(
      () => FaqListController(),
    );
  }
}
