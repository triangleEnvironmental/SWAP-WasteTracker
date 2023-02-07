import 'package:get/get.dart';
import 'package:waste_tracker/app/models/index.dart' as model;
import 'package:waste_tracker/app/modules/notification/notification_list/controllers/notification_list_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/services/index.dart';

class NotificationDetailController extends GetxController {
  final notificationRepository = NotificationRepository();
  final informationService = Get.find<InformationService>();
  final id = Get.arguments?['id'] ?? 0;
  late Rx<Future<model.Notification>> notificationFuture;

  Future<model.Notification> fetchDetail() async {
    return await notificationRepository.detail(id);
  }

  Future refreshData() async {
    notificationFuture.value = fetchDetail();
    await notificationFuture.value;
  }

  markAsRead(model.Notification notification) async {
    final isUnread = notification.readAt == null;
    final result = await notificationRepository.read(notification.id);
    if (result != null) {
      try {
        final notificationListController = Get.find<NotificationListController>();
        final pagingController = notificationListController.pagingController;
        if (pagingController.itemList != null) {
          final listIndex = pagingController.itemList!.indexWhere((e) => e.id == notification.id);
          if (listIndex > -1) {
            pagingController.itemList![listIndex] = result;
            pagingController.notifyListeners();
          }
        }
      } catch (e) {
        print(e);
      }
      if (isUnread) {
        informationService.decreaseNotificationCount();
      }
    }
  }

  @override
  void onInit() {
    print("Mark as read");
    print(id);
    notificationFuture = fetchDetail().obs;

    notificationFuture.value.then((value) {
      print("Mark as read");
      markAsRead(value);
    });
    super.onInit();
  }
}
