// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodiac_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZodiacDateAdapter extends TypeAdapter<ZodiacDate> {
  @override
  final int typeId = 0;

  @override
  ZodiacDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZodiacDate(
      month: fields[0] as int,
      day: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ZodiacDate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZodiacDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
