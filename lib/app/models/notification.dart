import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

@HiveType(typeId: 20)
@Freezed(makeCollectionsUnmodifiable: true)
class Notification with _$Notification {
  const Notification._();

  factory Notification({
    @HiveField(0) required int id,
    @HiveField(1) MasterNotification? master,
    @HiveField(2) DateTime? readAt,
    @HiveField(3) DateTime? createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}