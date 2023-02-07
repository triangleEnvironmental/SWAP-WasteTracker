import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

class ReportFilter extends ValueListenable {
  List<ReportStatus> statuses = [];
  Sector? sector;
  List<ReportType> types = [];
  Area? province;
  DateTimeRange? dateRange;
  bool isListView = false;
  bool isWithinMyArea = true;

  DateTimeRange? get defaultRange {
    return dateRange;
    final informationService = Get.find<InformationService>();
    return dateRange ??
        DateTimeRange(
          start: informationService.reportFilterOption.value!.minDate,
          end: DateTime.now(),
        );
  }

  bool get hasFilter => statuses.isNotEmpty || sector != null || types.isNotEmpty || dateRange != null || province != null || (isListView && isWithinMyArea);

  Map<String, dynamic> get requestBody {
    Map<String, dynamic> body = {};
    if (sector != null) {
      body['sector_ids'] = [sector!.id];
    }
    if (types.isNotEmpty) {
      body['report_type_ids'] = types.map((e) => e.id).toList();
    }
    if (statuses.isNotEmpty) {
      body['status_ids'] = statuses.map((e) => e.id).toList();
    }
    if (province != null) {
      body['area_ids'] = [province!.id];
    } else if (isListView && isWithinMyArea) {
      final locationService = Get.find<LocationService>();
      if (locationService.lastKnownLocation.value != null) {
        body['lat'] = locationService.lastKnownLocation.value!.latitude;
        body['lng'] = locationService.lastKnownLocation.value!.longitude;
      }
    }
    if (dateRange != null) {
      body['date_range'] = [dateRange!.start.toIso8601String(), dateRange!.end.toIso8601String()];
    }
    return body;
  }

  ReportFilter clone() {
    return ReportFilter()
      ..statuses = List.from(statuses)
      ..sector = sector
      ..types = List.from(types)
      ..province = province
      ..dateRange = dateRange
      ..isWithinMyArea = isWithinMyArea
      ..isListView = isListView;
  }

  update(VoidCallback callback) {
    callback();
    notifyListener();
  }

  void apply(ReportFilter filter) {
    statuses = filter.statuses;
    sector = filter.sector;
    types = filter.types;
    province = filter.province;
    dateRange = filter.dateRange;
    isWithinMyArea = filter.isWithinMyArea;
    isListView = filter.isListView;
    notifyListener();
  }

  void reset({bool clearAll = false}) {
    statuses = [];
    sector = null;
    types = [];
    province = null;
    dateRange = null;
    if (isListView && !clearAll) {
      isWithinMyArea = true;
    } else {
      isWithinMyArea = false;
    }
    notifyListener();
  }

  PreferredSizeWidget display({
    VoidCallback? onTap,
  }) =>
      PreferredSize(
        preferredSize: Size(
          Get.width,
          hasFilter ? kToolbarHeight : 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Builder(
            builder: (context) {
              if (hasFilter) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          left: AppDimens.marginHorizontal,
                          right: AppDimens.marginHorizontal / 2,
                        ),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isListView && isWithinMyArea)
                              Pill(
                                text: LocaleKeys.label_my_area,
                                onTap: onTap,
                                color: statuses.length == 1 && statuses.first.color != null ? AppColors.fromHex(statuses.first.color!) : AppColors.primaryColor,
                                onClose: () {
                                  isWithinMyArea = false;
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            if (statuses.isNotEmpty)
                              Pill(
                                text: statuses.map((e) => e.name).join(' | '),
                                onTap: onTap,
                                onClose: () {
                                  isWithinMyArea = false;
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            if (sector != null && types.isNotEmpty)
                              Pill(
                                text: "${sector!.name} : ${types.map((e) => e.name).join(' | ')}",
                                onTap: onTap,
                                onClose: () {
                                  sector = null;
                                  types.clear();
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2)
                            else ...[
                              if (sector != null)
                                Pill(
                                  text: sector!.name,
                                  onTap: onTap,
                                  onClose: () {
                                    sector = null;
                                    notifyListener();
                                  },
                                ).marginOnly(right: AppDimens.marginHorizontal / 2),
                              if (types.isNotEmpty)
                                Pill(
                                  text: types.map((e) => e.name).join(' | '),
                                  onTap: onTap,
                                  onClose: () {
                                    types.clear();
                                    notifyListener();
                                  },
                                ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            ],
                            if (province != null)
                              Pill(
                                text: province!.name,
                                onTap: onTap,
                                onClose: () {
                                  province = null;
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            if (dateRange != null)
                              Pill(
                                text: '${formatShortDate(dateRange!.start)} - ${formatShortDate(dateRange!.end)}',
                                onTap: onTap,
                                onClose: () {
                                  dateRange = null;
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                          ],
                        ).paddingOnly(
                          bottom: 12,
                        ),
                      ),
                    ),
                    SmallIconButton(
                      icon: AppIcons.close,
                      color: Colors.black,
                      onPressed: () {
                        reset(clearAll: true);
                      },
                    ).marginOnly(
                      bottom: 8,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );

  notifyListener() {
    for (final listener in listeners) {
      listener();
    }
  }

  List<VoidCallback> listeners = [];

  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  @override
  get value => this;
}
