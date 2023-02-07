// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportAdapter extends TypeAdapter<Report> {
  @override
  final int typeId = 10;

  @override
  Report read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Report(
      id: fields[0] as int,
      description: fields[1] as String?,
      location: fields[2] as Point?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as DateTime?,
      sectorId: fields[5] as int?,
      sector: fields[6] as Sector?,
      reportTypeId: fields[7] as int?,
      reportType: fields[8] as ReportType?,
      reportedByUserId: fields[9] as int?,
      reporter: fields[10] as User?,
      reportStatusId: fields[11] as int?,
      status: fields[12] as ReportStatus?,
      medias: (fields[13] as List?)?.cast<Media>(),
      citizenViewModerationHistory:
          (fields[14] as List?)?.cast<ModerationHistory>(),
      province: fields[15] as Area?,
      canComment: fields[16] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Report obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.sectorId)
      ..writeByte(6)
      ..write(obj.sector)
      ..writeByte(7)
      ..write(obj.reportTypeId)
      ..writeByte(8)
      ..write(obj.reportType)
      ..writeByte(9)
      ..write(obj.reportedByUserId)
      ..writeByte(10)
      ..write(obj.reporter)
      ..writeByte(11)
      ..write(obj.reportStatusId)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.medias)
      ..writeByte(14)
      ..write(obj.citizenViewModerationHistory)
      ..writeByte(15)
      ..write(obj.province)
      ..writeByte(16)
      ..write(obj.canComment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map json) => _$_Report(
      id: json['id'] as int,
      description: json['description'] as String?,
      location: json['location'] == null
          ? null
          : Point.fromJson(Map<String, dynamic>.from(json['location'] as Map)),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      sectorId: json['sector_id'] as int?,
      sector: json['sector'] == null
          ? null
          : Sector.fromJson(Map<String, dynamic>.from(json['sector'] as Map)),
      reportTypeId: json['report_type_id'] as int?,
      reportType: json['report_type'] == null
          ? null
          : ReportType.fromJson(
              Map<String, dynamic>.from(json['report_type'] as Map)),
      reportedByUserId: json['reported_by_user_id'] as int?,
      reporter: json['reporter'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['reporter'] as Map)),
      reportStatusId: json['report_status_id'] as int?,
      status: json['status'] == null
          ? null
          : ReportStatus.fromJson(
              Map<String, dynamic>.from(json['status'] as Map)),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      citizenViewModerationHistory: (json['citizen_view_moderation_history']
              as List<dynamic>?)
          ?.map((e) =>
              ModerationHistory.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      province: json['province'] == null
          ? null
          : Area.fromJson(Map<String, dynamic>.from(json['province'] as Map)),
      canComment: json['can_comment'] as bool?,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'location': instance.location?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'sector_id': instance.sectorId,
      'sector': instance.sector?.toJson(),
      'report_type_id': instance.reportTypeId,
      'report_type': instance.reportType?.toJson(),
      'reported_by_user_id': instance.reportedByUserId,
      'reporter': instance.reporter?.toJson(),
      'report_status_id': instance.reportStatusId,
      'status': instance.status?.toJson(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'citizen_view_moderation_history': instance.citizenViewModerationHistory
          ?.map((e) => e.toJson())
          .toList(),
      'province': instance.province?.toJson(),
      'can_comment': instance.canComment,
    };
