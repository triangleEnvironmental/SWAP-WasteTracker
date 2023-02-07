import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/models/index.dart';

part 'home_page_data.freezed.dart';
part 'home_page_data.g.dart';

@HiveType(typeId: 8)
@Freezed(makeCollectionsUnmodifiable: true)
class HomePageData with _$HomePageData {
  const HomePageData._();

  factory HomePageData({
    @HiveField(0) required List<Institution> municipalities,
    @HiveField(1) required List<Institution> serviceProviders,
    @HiveField(2) required List<Sector> sectors,
    @HiveField(3) required List<Faq> faqs,
  }) = _HomePageData;

  Institution? get institution {
    if (municipalities.isNotEmpty) {
      return municipalities.first;
    } else if (serviceProviders.isNotEmpty) {
      return serviceProviders.first;
    }
    return null;
  }

  factory HomePageData.fromJson(Map<String, dynamic> json) => _$HomePageDataFromJson(json);
}