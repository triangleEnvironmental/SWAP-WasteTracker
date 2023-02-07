// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomePageDataAdapter extends TypeAdapter<HomePageData> {
  @override
  final int typeId = 8;

  @override
  HomePageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomePageData(
      municipalities: (fields[0] as List).cast<Institution>(),
      serviceProviders: (fields[1] as List).cast<Institution>(),
      sectors: (fields[2] as List).cast<Sector>(),
      faqs: (fields[3] as List).cast<Faq>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomePageData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.municipalities)
      ..writeByte(1)
      ..write(obj.serviceProviders)
      ..writeByte(2)
      ..write(obj.sectors)
      ..writeByte(3)
      ..write(obj.faqs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomePageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomePageData _$$_HomePageDataFromJson(Map json) => _$_HomePageData(
      municipalities: (json['municipalities'] as List<dynamic>)
          .map((e) => Institution.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      serviceProviders: (json['service_providers'] as List<dynamic>)
          .map((e) => Institution.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      sectors: (json['sectors'] as List<dynamic>)
          .map((e) => Sector.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      faqs: (json['faqs'] as List<dynamic>)
          .map((e) => Faq.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_HomePageDataToJson(_$_HomePageData instance) =>
    <String, dynamic>{
      'municipalities': instance.municipalities.map((e) => e.toJson()).toList(),
      'service_providers':
          instance.serviceProviders.map((e) => e.toJson()).toList(),
      'sectors': instance.sectors.map((e) => e.toJson()).toList(),
      'faqs': instance.faqs.map((e) => e.toJson()).toList(),
    };
