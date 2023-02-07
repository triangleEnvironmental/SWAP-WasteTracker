import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class FaqListPage extends StatefulWidget {
  final Sector sector;

  const FaqListPage({Key? key, required this.sector}) : super(key: key);

  @override
  State<FaqListPage> createState() => _FaqListPageState();
}

class _FaqListPageState extends State<FaqListPage> with AutomaticKeepAliveClientMixin {
  final faqRepository = FaqRepository();
  final PagingController<int, Faq> pagingController = PagingController(firstPageKey: 1);

  _fetchPage(int page) async {
    try {
      final pagination = await faqRepository.listPage(
        page: page,
        sectorId: widget.sector.id,
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

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          10.y.sliver,
          PagedSliverList<int, Faq>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<Faq>(
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
                      LocaleKeys.label_faq_empty,
                      style: Get.textTheme.headline6,
                    ),
                    16.y,
                  ],
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) {
                String errorMessage = LocaleKeys.phrase_not_your_mistake;

                errorMessage = getErrorMessage(pagingController.error);

                return ErrorView(
                  image: Image.asset(
                    AppStrings.errorImage,
                    width: Get.width * 0.8,
                  ),
                  title: LocaleKeys.label_something_went_wrong,
                  description: errorMessage,
                  bottom: FilledButton(
                    onPressed: () {
                      pagingController.refresh();
                    },
                    icon: const Icon(AppIcons.refresh),
                    child: Text(LocaleKeys.button_try_again),
                  ),
                );
              },
              itemBuilder: (context, faq, index) {
                return Card(
                  margin: EdgeInsets.zero,
                  surfaceTintColor: AppColors.backgroundContrastColor(context),
                  child: InkWell(
                    borderRadius: AppDimens.borderRadiusMd,
                    onTap: () {
                      Get.toNamed(
                        Routes.routeFaqDetail,
                        arguments: {
                          'id': faq.id,
                        },
                        preventDuplicates: false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            AppIcons.faq,
                            color: AppColors.primaryColor,
                          ),
                          10.x,
                          Expanded(
                            child: Text(
                              faq.question,
                              style: Get.textTheme.bodyText2?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
