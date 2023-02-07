import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/utils/helpers.dart';

part 'report_status.freezed.dart';

part 'report_status.g.dart';

@HiveType(typeId: 11)
@Freezed(makeCollectionsUnmodifiable: true)
class ReportStatus with _$ReportStatus {
  const ReportStatus._();

  factory ReportStatus({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
    @HiveField(3) String? color,
    @HiveField(4) String? key,
  }) = _ReportStatus;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  @override
  bool operator ==(Object other) => other is ReportStatus && other.id == id;

  factory ReportStatus.fromJson(Map<String, dynamic> json) => _$ReportStatusFromJson(json);
}
