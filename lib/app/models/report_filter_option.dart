import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/models/index.dart';

part 'report_filter_option.freezed.dart';

part 'report_filter_option.g.dart';

@HiveType(typeId: 15)
@Freezed(makeCollectionsUnmodifiable: true)
class ReportFilterOption with _$ReportFilterOption {
  const ReportFilterOption._();

  factory ReportFilterOption({
    @HiveField(0) required DateTime minDate,
    @HiveField(1) required List<Sector> sectors,
    @HiveField(2) required List<ReportStatus> statuses,
    @HiveField(3) required List<Area> provinces,
    @HiveField(4) required List<ReportStatus>? allStatuses,
  }) = _ReportFilterOption;

  factory ReportFilterOption.fromJson(Map<String, dynamic> json) => _$ReportFilterOptionFromJson(json);
}