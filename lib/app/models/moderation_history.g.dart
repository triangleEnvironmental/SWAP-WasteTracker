// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModerationHistoryAdapter extends TypeAdapter<ModerationHistory> {
  @override
  final int typeId = 14;

  @override
  ModerationHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModerationHistory(
      id: fields[0] as int?,
      profile: fields[1] as String?,
      name: fields[2] as Nameable?,
      action: fields[3] as String?,
      oldStatus: fields[4] as ReportStatus?,
      newStatus: fields[5] as ReportStatus?,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ModerationHistory obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profile)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.action)
      ..writeByte(4)
      ..write(obj.oldStatus)
      ..writeByte(5)
      ..write(obj.newStatus)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModerationHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModerationHistory _$$_ModerationHistoryFromJson(Map json) =>
    _$_ModerationHistory(
      id: json['id'] as int?,
      profile: json['profile'] as String?,
      name: json['name'] == null
          ? null
          : Nameable.fromJson(Map<String, dynamic>.from(json['name'] as Map)),
      action: json['action'] as String?,
      oldStatus: json['old_status'] == null
          ? null
          : ReportStatus.fromJson(
              Map<String, dynamic>.from(json['old_status'] as Map)),
      newStatus: json['new_status'] == null
          ? null
          : ReportStatus.fromJson(
              Map<String, dynamic>.from(json['new_status'] as Map)),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_ModerationHistoryToJson(
        _$_ModerationHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'name': instance.name?.toJson(),
      'action': instance.action,
      'old_status': instance.oldStatus?.toJson(),
      'new_status': instance.newStatus?.toJson(),
      'date': instance.date?.toIso8601String(),
    };
