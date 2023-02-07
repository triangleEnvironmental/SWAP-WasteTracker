import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/utils/helpers.dart';

part 'faq_category.freezed.dart';

part 'faq_category.g.dart';

@HiveType(typeId: 19)
@Freezed(makeCollectionsUnmodifiable: true)
class FaqCategory with _$FaqCategory {
  const FaqCategory._();

  factory FaqCategory({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
  }) = _FaqCategory;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  factory FaqCategory.fromJson(Map<String, dynamic> json) => _$FaqCategoryFromJson(json);
}
