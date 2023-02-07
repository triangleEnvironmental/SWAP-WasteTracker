import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart' as model;
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/locales/index.dart';

class NotificationListController extends GetxController {
  final notificationRepository = NotificationRepository();
  final informationService = Get.find<InformationService>();
  final PagingController<int, model.Notification> pagingController = PagingController(firstPageKey: 1);

  _fetchPage(int page) async {
    try {
      final pagination = await notificationRepository.list(
        page: page,
      );
      final isLastPage = !pagination.hasMorePage;
      // pagingController.appendLastPage([]);
      if (isLastPage) {
        pagingController.appendLastPage(pagination.getData());
      } else {
        final nextPageKey = pagination.currentPage + 1;
        pagingController.appendPage(pagination.getData(), nextPageKey);
      }
    } catch (error) {
      print(error);
      pagingController.error = error;
    }
  }

  Future onRefresh() async {
    pagingController.refresh();
  }

  readNotification(model.Notification notification) async {
    final isUnread = notification.readAt == null;
    final result = await notificationRepository.read(notification.id);
    if (result != null) {
      if (pagingController.itemList != null) {
        pagingController.itemList![pagingController.itemList!.indexOf(notification)] = result!;
        pagingController.notifyListeners();
      }
      if (isUnread) {
        informationService.decreaseNotificationCount();
      }
    }
  }

  markAllAsRead() async {
    startLoading();
    final result = await notificationRepository.markAsReadAll();
    stopLoading();
    if (result == true) {
      pagingController.itemList = pagingController.itemList!.map((e) {
        if (e.readAt == null) {
          return e.copyWith(
            readAt: DateTime.now(),
          );
        }
        return e;
      }).toList();
      informationService.unreadNotificationCount.value = 0;
      pagingController.notifyListeners();
    }
  }

  deleteNotification(model.Notification notification) async {
    final isUnread = notification.readAt == null;
    startLoading();
    final result = await notificationRepository.deleteNotification(notification.id);
    stopLoading();
    if (result == true) {
      pagingController.itemList?.remove(notification);
      pagingController.notifyListeners();
      if (isUnread) {
        informationService.decreaseNotificationCount();
      }
    }
  }

  notificationAction(model.Notification notification) async {
    Get.bottomSheet(
      Material(
        borderRadius: const BorderRadius.vertical(
          top: AppDimens.radiusSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.y,
            ListTile(
              onTap: () async {
                Get.back();
                readNotification(notification);
              },
              leading: const Icon(AppIcons.read),
              title: Text(
                LocaleKeys.label_mark_as_read,
              ),
            ),
            ListTile(
              onTap: () async {
                Get.back();
                deleteNotification(notification);
              },
              leading: const Icon(AppIcons.delete),
              title: Text(
                LocaleKeys.label_remove_notification,
              ),
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

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }
}
