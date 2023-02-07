import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:waste_tracker/app/models/index.dart';

part 'moderation_history.freezed.dart';

part 'moderation_history.g.dart';

@HiveType(typeId: 14)
@Freezed(makeCollectionsUnmodifiable: true)
class ModerationHistory with _$ModerationHistory {
  const ModerationHistory._();

  factory ModerationHistory({
    @HiveField(0) int? id,
    @HiveField(1) String? profile,
    @HiveField(2) Nameable? name,
    @HiveField(3) String? action,
    @HiveField(4) ReportStatus? oldStatus,
    @HiveField(5) ReportStatus? newStatus,
    @HiveField(6) DateTime? date,
  }) = _ModerationHistory;

  factory ModerationHistory.fromJson(Map<String, dynamic> json) => _$ModerationHistoryFromJson(json);
}