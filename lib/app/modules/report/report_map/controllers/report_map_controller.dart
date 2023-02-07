import 'dart:async';
import 'dart:ui' as ui;

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/modules/report/report_list/controllers/report_list_controller.dart';
import 'package:waste_tracker/app/repositories/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';

class ReportMapController extends GetxController {
  final locationService = Get.find<LocationService>();
  final informationService = Get.find<InformationService>();
  final reportRepository = ReportRepository();
  final markerAsset = MarkerAsset();
  late ReportFilter reportFilter;
  final canSwitchView = Get.arguments?['switch-view'] != 'NO';

  Rx<bool> isLoading = true.obs;
  RxSet<Marker> markers = RxSet();
  late Rx<CameraPosition> initialCameraPosition;
  Completer<GoogleMapController> mapController = Completer();

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

  int fetchCounter = 0;

  fetchMarkers() async {
    isLoading.value = true;
    var currentRequestCounter = ++fetchCounter;
    EasyDebounce.cancel('FETCH_MAP');
    EasyDebounce.debounce(
      'FETCH_MAP',
      const Duration(milliseconds: 50),
      () async {
        final GoogleMapController controller = await mapController.future;
        LatLngBounds bounds = await controller.getVisibleRegion();
        double zoomLevel = await controller.getZoomLevel();
        final result = await reportRepository.mapQuery(
          bounds: bounds,
          zoom: zoomLevel,
          filter: reportFilter,
        );
        if (result != null && currentRequestCounter == fetchCounter) {
          markers.assignAll(
            (await Future.wait(
              result.map(
                (marker) async {
                  return markerAsset.makeMarker(marker, controller);
                },
              ),
            ))
                .whereType<Marker>(),
          );
          isLoading.value = false;
        }
      },
    );
  }

  onSwitchView() {
    Get.toNamed(
      Routes.routeReportList,
      arguments: {
        'switch-view': 'NO',
      },
    );
  }

  @override
  void onInit() {
    markerAsset.init();
    if (canSwitchView) {
      reportFilter = ReportFilter();
    } else {
      final reportListController = Get.find<ReportListController>();
      reportFilter = reportListController.reportFilter.clone()..isListView = false;
    }

    // fetchMarkers(); // It will detect bound as zero
    reportFilter.addListener(fetchMarkers);

    initialCameraPosition = CameraPosition(
      target: locationService.lastLatLng?.location ?? getDefaultLatLng(),
      zoom: 12,
    ).obs;
    super.onInit();
  }

  @override
  void onClose() {
    reportFilter.removeListener(fetchMarkers);
    super.onClose();
  }
}
