import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/globals/location_picked_result.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/page_repository.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class HomePage extends StatefulWidget {
  final LocationWithAddress position;

  const HomePage({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late LocationWithAddress position;
  late Future<HomePageData?> future;
  final pageRepository = PageRepository();

  Future retry() async {
    setState(() {
      future = pageRepository.getHomePageData(position);
    });
    return await future;
  }

  @override
  void initState() {
    position = widget.position;
    future = pageRepository.getHomePageData(position);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: retry,
      child: FutureBuilder<HomePageData?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: [
                if (data.institution != null) ...[
                  10.y,
                  Card(
                    color: AppColors.backgroundContrastColor(context),
                    margin: EdgeInsets.zero,
                    shadowColor: AppColors.shadowColor,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.label_you_are_currently_in,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          10.y,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                data.institution!.icon,
                                color: AppColors.blue,
                              ).paddingOnly(bottom: 6),
                              5.x,
                              Expanded(
                                child: Text(
                                  data.institution!.name,
                                  style: context.textTheme.headline5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).m,
                ],
                10.y,
                SectionTitle(
                  icon: AppIcons.addReport,
                  label: LocaleKeys.label_make_a_new_report,
                ).m,
                Card(
                  color: AppColors.primaryColor,
                  elevation: 0,
                  shadowColor: AppColors.shadowColor,
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppDimens.marginHorizontal,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.sectors.isNotEmpty)
                          Grid(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: Get.width ~/ 120,
                            childAspectRatio: 0.65,
                            children: [
                              for (Sector sector in data.sectors)
                                ClipRRect(
                                  borderRadius: AppDimens.borderRadiusSm,
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.routeReportCreateReport,
                                          arguments: {
                                            'sector': sector,
                                          },
                                          preventDuplicates: false,
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: sector.icon,
                                          ),
                                          const Icon(
                                            AppIcons.addCircle,
                                            size: 24,
                                          ),
                                          4.y,
                                          RichText(
                                            textAlign: TextAlign.center,
                                            textScaleFactor: Get.textScaleFactor,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              style: Get.textTheme.bodyText2,
                                              children: [
                                                // WidgetSpan(
                                                //   baseline: TextBaseline.alphabetic,
                                                //   alignment: PlaceholderAlignment.middle,
                                                //   child: const Icon(
                                                //     AppIcons.addCircle,
                                                //     size: 12,
                                                //   ).marginOnly(right: 2),
                                                // ),
                                                TextSpan(
                                                  text: sector.name,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          2.y,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        else
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AppStrings.noServiceImage,
                                  width: Get.width / 2,
                                ),
                                16.y,
                                Text(
                                  LocaleKeys.label_service_not_available,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.contrastTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                20.y,
                if (data.faqs.isNotEmpty) ...[
                  SectionTitle(
                    icon: AppIcons.faq,
                    label: LocaleKeys.label_clean_city_tips,
                    trailing: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.routeFaqList);
                      },
                      child: Text(LocaleKeys.label_see_all),
                    ),
                  ).marginOnly(
                    left: AppDimens.marginHorizontal,
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.marginHorizontal,
                      ),
                      itemCount: data.faqs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final faq = data.faqs[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.routeFaqDetail,
                              arguments: {
                                'id': faq.id,
                              },
                              preventDuplicates: false,
                            );
                          },
                          child: Card(
                            shadowColor: AppColors.shadowColor,
                            margin: EdgeInsets.zero,
                            color: AppColors.primaryColor,
                            elevation: 0,
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 0.68,
                                  child: Center(
                                    child: Text(
                                      faq.question,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.contrastTextColor,
                                      ),
                                    ),
                                  ).paddingAll(6),
                                ),
                                if (faq.sector != null)
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Padding(
                                        padding: 1.p,
                                        child: Container(
                                          padding: 2.p,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 1.4,
                                            ),
                                          ),
                                          child: faq.sector!.icon.sized(20).circle,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ).marginOnly(
                            bottom: 20,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => 8.x,
                    ),
                  ),
                ],
                40.y,
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingWidget(),
            );
          }
          return ErrorView(
            image: Image.asset(AppStrings.errorImage),
            title: LocaleKeys.title_failed_to_get_data,
            description: getErrorMessage(snapshot.error),
            action: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: retry,
                  child: Text(LocaleKeys.button_retry),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
