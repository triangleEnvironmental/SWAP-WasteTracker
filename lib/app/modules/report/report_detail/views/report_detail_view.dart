import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/report/report_detail/controllers/report_detail_controller.dart';
import 'package:waste_tracker/app/modules/report/report_detail/views/comments_sliver_list.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ReportDetailView extends GetView<ReportDetailController> {
  const ReportDetailView({Key? key}) : super(key: key);

  @override
  String? get tag => "${Get.arguments?['id']}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_details),
        actions: [
          Obx(
            () => (controller.moderationHistory.isNotEmpty)
                ? IconButton(
                    tooltip: LocaleKeys.label_moderation_history,
                    onPressed: () {
                      controller.viewModerationHistory();
                    },
                    icon: const Icon(
                      AppIcons.moderationHistory,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshReport,
        child: Obx(
          () => FutureBuilder<Report>(
            future: controller.reportFuture.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final report = snapshot.data!;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //region Reporter info
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserAvatar(
                                report.reporter?.profilePhotoUrl,
                                defaultAsset: AppStrings.avatarPlaceholder,
                              ).sized(40).circle,
                              10.x,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        String? displayName = report.reporter?.fullName;
                                        bool hasName = false;
                                        if (report.reporter == null) {
                                          displayName = LocaleKeys.label_anonymous;
                                        } else if (displayName == null || displayName.isEmpty) {
                                          displayName = LocaleKeys.label_no_name;
                                        } else {
                                          hasName = true;
                                        }
                                        return Text(
                                          displayName,
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.textTheme.subtitle1?.copyWith(
                                            color: hasName ? null : AppColors.greyText,
                                            fontWeight: hasName ? FontWeight.bold : FontWeight.normal,
                                            // fontStyle: hasName ? null : FontStyle.italic,
                                          ),
                                        );
                                      },
                                    ),
                                    RichText(
                                      textScaleFactor: Get.textScaleFactor,
                                      text: TextSpan(
                                        style: Get.textTheme.bodyText2?.copyWith(
                                          color: AppColors.greyText,
                                        ),
                                        children: [
                                          if (report.createdAt != null)
                                            TextSpan(
                                              text: displayReadableDate(report.createdAt!),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (report.status != null)
                                      Container(
                                        margin: 3.pv,
                                        padding: 6.ph,
                                        decoration: BoxDecoration(
                                          color: report.status?.color != null ? AppColors.fromHex(report.status!.color!) : AppColors.primaryColor,
                                          borderRadius: AppDimens.borderRadiusLg,
                                        ),
                                        child: Text(
                                          report.status!.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ).marginSymmetric(
                            horizontal: AppDimens.marginHorizontal,
                            vertical: 10,
                          ),

                          //endregion

                          //region Province
                          if (report.province != null)
                            Row(
                              children: [
                                Text(
                                  "${LocaleKeys.label_province_city} : ",
                                  style: const TextStyle(
                                    color: AppColors.greyText,
                                  ),
                                ),
                                5.x,
                                Pill(
                                  text: report.province!.name,
                                  small: true,
                                ),
                              ],
                            ).marginSymmetric(
                              horizontal: AppDimens.marginHorizontal,
                            ),
                          10.y,
                          //endregion

                          //region Sector and report type
                          if (report.sector != null || report.reportType != null)
                            RichText(
                              textScaleFactor: Get.textScaleFactor,
                              text: TextSpan(
                                style: Get.textTheme.bodyText2,
                                children: [
                                  if (report.sector != null) ...[
                                    WidgetSpan(
                                      child: report.sector!.icon.sized(20),
                                    ),
                                    TextSpan(
                                      text: ' ${report.sector!.name}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (report.reportType != null)
                                      const TextSpan(
                                        text: ' : ',
                                      ),
                                  ] else if (report.reportType != null)
                                    WidgetSpan(
                                      baseline: TextBaseline.alphabetic,
                                      alignment: PlaceholderAlignment.middle,
                                      child: const Icon(
                                        AppIcons.reportType,
                                        size: 18,
                                      ).marginOnly(right: 4),
                                    ),
                                  if (report.reportType != null)
                                    TextSpan(
                                      text: report.reportType!.name,
                                    ),
                                ],
                              ),
                            ).m,
                          //endregion

                          //region Description and images
                          if (report.description != null)
                            Text(
                              report.description!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ).paddingSymmetric(
                              horizontal: AppDimens.marginHorizontal,
                              vertical: 26,
                            ),
                          // Container(
                          //   margin: const EdgeInsets.symmetric(
                          //     vertical: 12,
                          //   ),
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 10,
                          //     vertical: 12,
                          //   ),
                          //   decoration: const BoxDecoration(
                          //     color: AppColors.lightBackground,
                          //     border: Border(
                          //       left: BorderSide(
                          //         color: AppColors.darkBackground,
                          //         width: 4,
                          //       ),
                          //     ),
                          //   ),
                          //   child: Text(
                          //     report.description!,
                          //     maxLines: 3,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ).m,
                          //endregion
                        ],
                      ),
                    ),

                    const SectionDivider().sliver,

                    if (report.medias?.isNotEmpty ?? false)
                      SliverStickyHeader(
                        header: Material(
                          child: SectionTitle(
                            icon: AppIcons.images,
                            label: LocaleKeys.label_report_images,
                          ).m,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              for (final media in report.medias!) ...[
                                UserAvatar(
                                  media.mediaUrl,
                                  width: Get.width,
                                  previewIndex: report.medias!.indexOf(media),
                                  previewImages: report.medias!.map((e) => NetworkImage(e.mediaUrl)).toList(),
                                  defaultAsset: AppStrings.reportImagePlaceholder,
                                ).bordered,
                                if (report.medias!.last != media) const SectionDivider(),
                              ],
                            ],
                          ),
                        ),
                      ),

                    const SectionDivider().sliver,

                    //region Static map preview
                    if (report.location != null) ...[
                      SliverStickyHeader(
                        header: Material(
                          child: SectionTitle(
                            icon: AppIcons.map,
                            label: LocaleKeys.label_report_location,
                          ).m,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Builder(
                                builder: (context) {
                                  double width = Get.width - (2 * AppDimens.marginHorizontal);
                                  double height = width * 0.66;
                                  var markerColor = AppColors.toHex(AppColors.primaryColor);
                                  return SizedBox(
                                    height: height,
                                    width: width,
                                    child: UserAvatar(
                                      "https://maps.googleapis.com/maps/api/staticmap?center=${report.location!.latitude},+${report.location!.longitude}&zoom=15&scale=${MediaQuery.of(context).devicePixelRatio}&size=${width.ceil() * 2}x${height.ceil() * 2}&maptype=roadmap&format=png&visual_refresh=true&markers=size:lar%7Ccolor:0x$markerColor%7C${report.location!.latitude},+${report.location!.longitude}&key=${AppStrings.googleApiKey}",
                                      defaultAsset: AppStrings.mapPlaceholder,
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: FilledButton(
                                  onPressed: () {
                                    navigateToMap(
                                      report.location!.latLng,
                                      report.reportType?.name ?? report.sector?.name,
                                      report.description,
                                    );
                                  },
                                  icon: const Icon(AppIcons.direction),
                                  child: Text(
                                    LocaleKeys.button_get_direction,
                                  ),
                                ).paddingSymmetric(
                                  vertical: 6,
                                  horizontal: AppDimens.marginHorizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    //endregion

                    const SectionDivider().sliver,

                    SliverStickyHeader(
                      header: Material(
                        child: SectionTitle(
                          icon: AppIcons.comment,
                          label: LocaleKeys.label_comments,
                          trailing: (report.canComment ?? false)
                              ? IconButton(
                                  tooltip: LocaleKeys.label_write_a_comment,
                                  onPressed: controller.writeComment,
                                  icon: const Icon(AppIcons.writeComment),
                                )
                              : null,
                        ).marginOnly(
                          left: AppDimens.marginHorizontal,
                        ),
                      ),
                      sliver: CommentSliverList(
                        controller.reportId,
                        key: controller.commentListKey,
                      ),
                    ),

                    40.y.sliver,
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
                    onPressed: controller.refreshReport,
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
