import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';

part 'media.freezed.dart';

part 'media.g.dart';

@HiveType(typeId: 13)
@Freezed(makeCollectionsUnmodifiable: true)
class Media with _$Media {
  const Media._();

  factory Media({
    @HiveField(0) required int id,
    @HiveField(1) String? path,
    @HiveField(2) required String mediaUrl,
    @HiveField(3) String? mediableType,
    @HiveField(4) int? mediableId,
  }) = _Media;

  Widget widget() => UserAvatar(
        mediaUrl,
        defaultAsset: AppStrings.reportImagePlaceholder,
        fit: BoxFit.cover,
      );

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}