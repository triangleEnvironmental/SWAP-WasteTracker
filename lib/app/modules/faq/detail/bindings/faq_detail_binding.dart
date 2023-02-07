import 'package:get/get.dart';

import '../controllers/faq_detail_controller.dart';

class FaqDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqDetailController>(
      () => FaqDetailController(),
      tag: "${Get.arguments?['id']}",
    );
  }
}
