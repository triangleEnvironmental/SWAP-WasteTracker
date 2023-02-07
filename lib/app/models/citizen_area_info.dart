import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'citizen_area_info.freezed.dart';

part 'citizen_area_info.g.dart';

@HiveType(typeId: 5)
@Freezed(makeCollectionsUnmodifiable: true)
class CitizenAreaInfo with _$CitizenAreaInfo {
  const CitizenAreaInfo._();

  factory CitizenAreaInfo({
    @HiveField(0) required List<Institution> serviceProviders,
    @HiveField(1) required List<Institution> municipalities,
    @HiveField(2) required List<Area> provinces,
  }) = _CitizenAreaInfo;

  factory CitizenAreaInfo.fromJson(Map<String, dynamic> json) => _$CitizenAreaInfoFromJson(json);
}