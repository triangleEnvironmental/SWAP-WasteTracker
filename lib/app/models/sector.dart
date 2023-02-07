import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';
import 'package:waste_tracker/app/widgets/index.dart';

part 'sector.freezed.dart';

part 'sector.g.dart';

@HiveType(typeId: 6)
@Freezed(makeCollectionsUnmodifiable: true)
class Sector with _$Sector {
  const Sector._();

  factory Sector({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
    @HiveField(3) String? iconPath,
    @HiveField(4) String? iconUrl,
    @HiveField(5) List<ReportType>? reportTypes,
  }) = _Sector;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  Widget get icon {
    return UserAvatar(
      iconUrl,
      defaultAsset: AppStrings.sectorPlaceholder,
      fit: BoxFit.contain,
    );
  }

  factory Sector.fromJson(Map<String, dynamic> json) => _$SectorFromJson(json);
}
