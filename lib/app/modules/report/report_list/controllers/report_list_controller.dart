import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/report/report_map/controllers/report_map_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';

class ReportListController extends GetxController {
  final reportRepository = ReportRepository();
  final canSwitchView = Get.arguments?['switch-view'] != 'NO';
  final informationService = Get.find<InformationService>();
  final PagingController<int, Report> pagingController = PagingController(firstPageKey: 1);
  late ReportFilter reportFilter;
  Rx<int> totalReports = 0.obs;

  onTapFilter() async {
    final result = await Get.dialog(
      Material(
        child: ReportFilterWidget(
          filter: reportFilter.clone(),
        ),
      ),
    );

    if (result is ReportFilter) {
      reportFilter.apply(result);
    }
  }

  onSwitchView() {
    Get.toNamed(
      Routes.routeReportMap,
      arguments: {
        'switch-view': 'NO',
      },
    );
  }

  Future onRefresh() async {
    nextTick(() {
      totalReports.value = 0;
    });
    pagingController.refresh();
  }

  _fetchPage(int page) async {
    try {
      final pagination = await reportRepository.listReport(
        page: page,
        filter: reportFilter,
      );
      nextTick(() {
        totalReports.value = pagination.total;
      });
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

  @override
  void onInit() {
    if (canSwitchView) {
      reportFilter = ReportFilter()..isListView = true;
    } else {
      final reportMapController = Get.find<ReportMapController>();
      reportFilter = reportMapController.reportFilter.clone()..isListView = true;
    }

    reportFilter.addListener(pagingController.refresh);

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    reportFilter.removeListener(pagingController.refresh);
    super.onClose();
  }
}
