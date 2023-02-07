import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/report/report_detail/views/comments_sliver_list.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class _ModerationTimeLine extends StatelessWidget {
  final List<ModerationHistory> history;
  final ScrollController controller;

  const _ModerationTimeLine(
    this.history, {
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusLg,
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SectionTitle(
            icon: AppIcons.moderationHistory,
            label: LocaleKeys.label_moderation_history,
            trailing: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                LocaleKeys.button_close,
                style: const TextStyle(
                  color: AppColors.danger,
                ),
              ),
            ),
          ).marginOnly(
            left: AppDimens.marginHorizontal,
          ),
          Expanded(
            child: Timeline.tileBuilder(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              controller: controller,
              theme: TimelineThemeData(
                nodePosition: 10 / Get.width,
                nodeItemOverlap: true,
                connectorTheme: const ConnectorThemeData(
                  color: AppColors.primaryColor,
                  thickness: 1,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                contentsAlign: ContentsAlign.basic,
                indicatorBuilder: (context, index) {
                  final profile = history[index].profile;
                  return UserAvatar(
                    profile,
                    defaultAsset: AppStrings.avatarPlaceholder,
                  ).sized(40).circle;
                },
                connectorBuilder: (context, index, _) => const SolidLineConnector(
                  thickness: 1,
                  color: AppColors.primaryColor,
                ),
                contentsBuilder: (context, index) {
                  final moderation = history[index];
                  return Card(
                    // surfaceTintColor: AppColors.backgroundContrastColor(context),
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox.expand(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              moderation.name?.name ?? LocaleKeys.label_no_name,
                              style: Get.textTheme.subtitle1?.copyWith(
                                color: moderation.name?.name == null ? AppColors.greyText : null,
                                fontWeight: moderation.name?.name == null ? null : FontWeight.bold,
                                // fontStyle: moderation.name?.name == null ? FontStyle.italic : null,
                              ),
                            ),
                            if (moderation.date != null)
                              Text(
                                displayReadableDate(moderation.date!),
                                style: const TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 12,
                                ),
                              ),
                            if (moderation.action == 'created')
                              Text(
                                LocaleKeys.label_created_this_report,
                              )
                            else if (moderation.action == 'updated')
                              RichText(
                                textScaleFactor: Get.textScaleFactor,
                                text: TextSpan(
                                  style: Get.textTheme.bodyText2,
                                  children: [
                                    if (moderation.oldStatus != null)
                                      WidgetSpan(
                                        baseline: TextBaseline.alphabetic,
                                        alignment: PlaceholderAlignment.middle,
                                        child: Container(
                                          margin: 3.pv,
                                          padding: 6.ph,
                                          decoration: BoxDecoration(
                                            color: moderation.oldStatus?.color != null ? AppColors.fromHex(moderation.oldStatus!.color!) : null,
                                            borderRadius: AppDimens.borderRadiusLg,
                                          ),
                                          child: Text(
                                            moderation.oldStatus!.name,
                                            style: Get.textTheme.bodySmall?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (moderation.oldStatus != null && moderation.newStatus != null)
                                      const WidgetSpan(
                                        baseline: TextBaseline.alphabetic,
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(
                                          AppIcons.arrowRight,
                                        ),
                                      ),
                                    if (moderation.newStatus != null)
                                      WidgetSpan(
                                        baseline: TextBaseline.alphabetic,
                                        alignment: PlaceholderAlignment.middle,
                                        child: Container(
                                          margin: 3.pv,
                                          padding: 6.ph,
                                          decoration: BoxDecoration(
                                            color: moderation.newStatus?.color != null ? AppColors.fromHex(moderation.newStatus!.color!) : null,
                                            borderRadius: AppDimens.borderRadiusLg,
                                          ),
                                          child: Text(
                                            moderation.newStatus!.name,
                                            style: Get.textTheme.bodySmall?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: history.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportDetailController extends GetxController {
  final reportRepository = ReportRepository();
  final reportId = Get.arguments?['id'] ?? 0;
  Rx<Report?> reportDetail = Rx(null);
  late Rx<Future<Report>> reportFuture;
  RxList<ModerationHistory> moderationHistory = RxList();
  final GlobalKey<CommentSliverListState> commentListKey = GlobalKey();

  Future<Report> fetchReport() async {
    final report = await reportRepository.detail(reportId);
    reportDetail.value = report;
    try {
      nextTick(() {
        if (report.citizenViewModerationHistory != null) {
          moderationHistory.assignAll(report.citizenViewModerationHistory!);
        }
      });
    } catch (_) {}
    return report;
  }

  writeComment() async {
    final result = await Get.toNamed(
      Routes.routeWriteComment,
      arguments: {
        'report': reportDetail.value,
      },
    );

    if (result is Comment) {
      commentListKey.currentState?.refresh();
    }
  }

  viewModerationHistory() async {
    if (moderationHistory.isEmpty) return;

    Get.bottomSheet(
      DraggableScrollableSheet(
        builder: (context, scrollController) => _ModerationTimeLine(
          moderationHistory,
          controller: scrollController,
        ),
        maxChildSize: (Get.height - Get.mediaQuery.padding.vertical) / Get.height,
        initialChildSize: 0.7,
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  Future refreshReport() async {
    reportFuture.value = fetchReport();
    commentListKey.currentState?.refresh();
    await reportFuture.value;
  }

  @override
  void onInit() {
    print("ON init controller");
    reportFuture = fetchReport().obs;
    super.onInit();
  }
}
