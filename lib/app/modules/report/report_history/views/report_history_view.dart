import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/report_history/controllers/report_history_controller.dart';
import 'package:waste_tracker/locales/index.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';

class ReportHistoryView extends GetView<ReportHistoryController> {
  const ReportHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.reportFilter,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.title_my_report_history),
            actions: [
              ValueListenableBuilder(
                valueListenable: controller.informationService.reportFilterOption,
                builder: (context, option, child) {
                  if (option == null) {
                    return const SizedBox();
                  } else {
                    return IconButton(
                      tooltip: LocaleKeys.title_report_filters,
                      onPressed: controller.onTapFilter,
                      icon: const Icon(AppIcons.filter),
                    );
                  }
                },
              ),
            ],
            bottom: controller.reportFilter.display(
              onTap: controller.onTapFilter,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Obx(() {
                      return Text("${LocaleKeys.label_total_reports}: ${controller.totalReports.value}");
                    }),
                  ).paddingSymmetric(vertical: 6),
                ),
                PagedSliverList<int, Report>(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Report>(
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
                            LocaleKeys.label_report_empty,
                            style: Get.textTheme.headline6,
                          ),
                          16.y,
                          if (controller.reportFilter.hasFilter)
                            Text(
                              LocaleKeys.phrase_no_reports_match_conditions,
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText2?.copyWith(
                                color: AppColors.greyText,
                              ),
                            ),
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
                    itemBuilder: (context, report, index) {
                      return ReportListItem(
                        report,
                        onTap: () {
                          Get.bottomSheet(
                            ReportPreviewWidget(report),
                            isScrollControlled: true,
                          );
                        },
                      ).marginSymmetric(
                        horizontal: AppDimens.marginHorizontal,
                        vertical: 5,
                      );
                    },
                  ),
                ),
                40.y.sliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
