// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodiac_sign.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZodiacSignAdapter extends TypeAdapter<ZodiacSign> {
  @override
  final int typeId = 1;

  @override
  ZodiacSign read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZodiacSign(
      title: fields[0] as String,
      titleRU: fields[1] as String,
      from: fields[3] as ZodiacDate,
      to: fields[4] as ZodiacDate,
    );
  }

  @override
  void write(BinaryWriter writer, ZodiacSign obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.titleRU)
      ..writeByte(2)
      ..write(obj.assetName)
      ..writeByte(3)
      ..write(obj.from)
      ..writeByte(4)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZodiacSignAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
