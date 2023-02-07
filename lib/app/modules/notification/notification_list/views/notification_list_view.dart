import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/modules/notification/notification_list/controllers/notification_list_controller.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';
import 'package:waste_tracker/app/models/index.dart' as model;

class NotificationListView extends GetView<NotificationListController> {
  const NotificationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_notifications),
        actions: [
          PopupMenuButton<Function>(
            onSelected: (fn) {
              fn();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: controller.markAllAsRead,
                child: Text(LocaleKeys.label_mark_all_as_read),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          slivers: [
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<model.Notification>(
                newPageProgressIndicatorBuilder: (context) => Center(
                  child: const LoadingWidget().paddingSymmetric(vertical: 10),
                ),
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: LoadingWidget(),
                ),
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.label_notification_empty,
                        style: Get.textTheme.headline6,
                      ),
                      16.y,
                    ],
                  ),
                ),
                firstPageErrorIndicatorBuilder: (context) {
                  String errorMessage = LocaleKeys.phrase_not_your_mistake;

                  errorMessage = getErrorMessage(controller.pagingController.error);

                  return ErrorView(
                    image: Image.asset(
                      AppStrings.errorImage,
                      width: Get.width * 0.8,
                    ),
                    title: LocaleKeys.label_something_went_wrong,
                    description: errorMessage,
                    bottom: FilledButton(
                      onPressed: () {
                        controller.pagingController.refresh();
                      },
                      icon: const Icon(AppIcons.refresh),
                      child: Text(LocaleKeys.button_try_again),
                    ),
                  );
                },
                itemBuilder: (context, notification, index) {
                  return Material(
                    color: notification.readAt == null ? AppColors.primaryColor.tonal : null,
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(
                          Routes.routeNotificationDetail,
                          arguments: {
                            'id': notification.id,
                          },
                          preventDuplicates: false,
                        );
                      },
                      leading: const Icon(AppIcons.notification),
                      title: Text(
                        notification.master?.title ?? '-',
                      ),
                      subtitle: notification.createdAt != null
                          ? Text(
                              displayReadableDate(notification.createdAt!),
                            )
                          : null,
                      trailing: IconButton(
                        onPressed: () {
                          controller.notificationAction(notification);
                        },
                        icon: const Icon(
                          AppIcons.other,
                        ),
                      ),
                    ),
                  );
                },
              ),
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
            ),
            40.y.sliver,
          ],
        ),
      ),
    );
  }
}
