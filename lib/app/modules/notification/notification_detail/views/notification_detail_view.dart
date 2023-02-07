import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/modules/notification/notification_detail/controllers/notification_detail_controller.dart';
import 'package:waste_tracker/app/modules/report/report_detail/bindings/report_detail_binding.dart';
import 'package:waste_tracker/app/modules/report/report_detail/views/report_detail_view.dart';
import 'package:waste_tracker/app/modules/write_comment/bindings/write_comment_binding.dart';
import 'package:waste_tracker/app/modules/write_comment/views/write_comment_view.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';
import 'package:waste_tracker/app/models/index.dart' as model;

class NotificationDetailView extends GetView<NotificationDetailController> {
  const NotificationDetailView({Key? key}) : super(key: key);

  @override
  String? get tag => "${Get.arguments?['id']}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_notification_details),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(
          () => FutureBuilder<model.Notification>(
            future: controller.notificationFuture.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final model.Notification notification = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.y,
                            if (notification.master?.institution != null)
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    UserAvatar(notification.master!.institution!.logoUrl).sized(80).circle,
                                    8.y,
                                    Text(
                                      notification.master!.institution!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ).marginOnly(
                                  bottom: 20,
                                ),
                              )
                            else if (notification.master?.creator != null)
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    UserAvatar(notification.master!.creator!.profilePhotoUrl).sized(80).circle,
                                    8.y,
                                    if (notification.master!.creator!.fullName != null)
                                      Text(
                                        notification.master!.creator!.fullName!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                  ],
                                ).marginOnly(
                                  bottom: 20,
                                ),
                              ),
                            Text(
                              notification.master?.title ?? '-',
                              style: Get.textTheme.headline6,
                            ).m,
                            if (notification.createdAt != null)
                              Text(
                                displayReadableDate(notification.createdAt!),
                                style: const TextStyle(
                                  color: AppColors.greyText,
                                ),
                              ).m,
                            20.y,
                            Text(
                              notification.master?.description ?? '-',
                            ).m,
                          ],
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (notification.master?.notificationableType == 'App\\Models\\Report') {
                          if (notification.master?.notificationableId != null) {
                            return BottomButton(
                              child: Text(
                                LocaleKeys.button_view_report,
                              ),
                              onPressed: () {
                                Get.toNamed(
                                  Routes.routeReportDetail,
                                  arguments: {
                                    'id': notification.master?.notificationableId,
                                  },
                                  preventDuplicates: false,
                                );
                              },
                            ).paddingAll(10);
                          }
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingWidget(),
                );
              } else {
                String errorMessage = LocaleKeys.phrase_not_your_mistake;

                errorMessage = getErrorMessage(snapshot.error);

                return ErrorView(
                  image: Image.asset(
                    AppStrings.errorImage,
                    width: Get.width * 0.8,
                  ),
                  title: LocaleKeys.label_something_went_wrong,
                  description: errorMessage,
                  bottom: FilledButton(
                    onPressed: controller.refreshData,
                    icon: const Icon(AppIcons.refresh),
                    child: Text(LocaleKeys.button_try_again),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
