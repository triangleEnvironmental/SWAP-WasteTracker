// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citizen_area_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CitizenAreaInfoAdapter extends TypeAdapter<CitizenAreaInfo> {
  @override
  final int typeId = 5;

  @override
  CitizenAreaInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CitizenAreaInfo(
      serviceProviders: (fields[0] as List).cast<Institution>(),
      municipalities: (fields[1] as List).cast<Institution>(),
      provinces: (fields[2] as List).cast<Area>(),
    );
  }

  @override
  void write(BinaryWriter writer, CitizenAreaInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.serviceProviders)
      ..writeByte(1)
      ..write(obj.municipalities)
      ..writeByte(2)
      ..write(obj.provinces);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CitizenAreaInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CitizenAreaInfo _$$_CitizenAreaInfoFromJson(Map json) => _$_CitizenAreaInfo(
      serviceProviders: (json['service_providers'] as List<dynamic>)
          .map((e) => Institution.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      municipalities: (json['municipalities'] as List<dynamic>)
          .map((e) => Institution.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>)
          .map((e) => Area.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_CitizenAreaInfoToJson(_$_CitizenAreaInfo instance) =>
    <String, dynamic>{
      'service_providers':
          instance.serviceProviders.map((e) => e.toJson()).toList(),
      'municipalities': instance.municipalities.map((e) => e.toJson()).toList(),
      'provinces': instance.provinces.map((e) => e.toJson()).toList(),
    };
