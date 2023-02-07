// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FaqCategoryAdapter extends TypeAdapter<FaqCategory> {
  @override
  final int typeId = 19;

  @override
  FaqCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FaqCategory(
      id: fields[0] as int,
      nameEn: fields[1] as String,
      nameKm: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FaqCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameKm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaqCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FaqCategory _$$_FaqCategoryFromJson(Map json) => _$_FaqCategory(
      id: json['id'] as int,
      nameEn: json['name_en'] as String,
      nameKm: json['name_km'] as String?,
    );

Map<String, dynamic> _$$_FaqCategoryToJson(_$_FaqCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
    };
