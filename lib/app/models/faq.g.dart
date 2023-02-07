// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FaqAdapter extends TypeAdapter<Faq> {
  @override
  final int typeId = 9;

  @override
  Faq read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Faq(
      id: fields[0] as int,
      questionEn: fields[1] as String,
      questionKm: fields[2] as String?,
      answerEn: fields[3] as String?,
      answerKm: fields[4] as String?,
      sector: fields[5] as Sector?,
      categories: (fields[6] as List?)?.cast<FaqCategory>(),
    );
  }

  @override
  void write(BinaryWriter writer, Faq obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.questionEn)
      ..writeByte(2)
      ..write(obj.questionKm)
      ..writeByte(3)
      ..write(obj.answerEn)
      ..writeByte(4)
      ..write(obj.answerKm)
      ..writeByte(5)
      ..write(obj.sector)
      ..writeByte(6)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaqAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Faq _$$_FaqFromJson(Map json) => _$_Faq(
      id: json['id'] as int,
      questionEn: json['question_en'] as String,
      questionKm: json['question_km'] as String?,
      answerEn: json['answer_en'] as String?,
      answerKm: json['answer_km'] as String?,
      sector: json['sector'] == null
          ? null
          : Sector.fromJson(Map<String, dynamic>.from(json['sector'] as Map)),
      categories: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => FaqCategory.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_FaqToJson(_$_Faq instance) => <String, dynamic>{
      'id': instance.id,
      'question_en': instance.questionEn,
      'question_km': instance.questionKm,
      'answer_en': instance.answerEn,
      'answer_km': instance.answerKm,
      'sector': instance.sector?.toJson(),
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };
