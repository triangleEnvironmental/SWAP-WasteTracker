import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/notification/notification_detail/controllers/notification_detail_controller.dart';

class NotificationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationDetailController>(
      () => NotificationDetailController(),
      tag: "${Get.arguments?['id']}",
    );
  }
}
