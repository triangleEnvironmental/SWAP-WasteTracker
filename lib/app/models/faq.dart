import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/utils/helpers.dart';

import 'index.dart';

part 'faq.freezed.dart';

part 'faq.g.dart';

@HiveType(typeId: 9)
@Freezed(makeCollectionsUnmodifiable: true)
class Faq with _$Faq {
  const Faq._();

  factory Faq({
    @HiveField(0) required int id,
    @HiveField(1) required String questionEn,
    @HiveField(2) String? questionKm,
    @HiveField(3) String? answerEn,
    @HiveField(4) String? answerKm,
    @HiveField(5) Sector? sector,
    @HiveField(6) List<FaqCategory>? categories,
  }) = _Faq;

  String get question {
    if (currentLocale.languageCode == 'km') {
      return questionKm ?? questionEn;
    }
    return questionEn;
  }

  String? get answer {
    if (currentLocale.languageCode == 'km') {
      return answerKm ?? answerEn;
    }
    return answerEn;
  }

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}
