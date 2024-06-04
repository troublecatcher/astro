// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_horoscope.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyHoroscopeAdapter extends TypeAdapter<WeeklyHoroscope> {
  @override
  final int typeId = 4;

  @override
  WeeklyHoroscope read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyHoroscope(
      horoscopeData: fields[0] as String,
      sign: fields[1] as ZodiacSign,
      week: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyHoroscope obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.horoscopeData)
      ..writeByte(1)
      ..write(obj.sign)
      ..writeByte(2)
      ..write(obj.week);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyHoroscopeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
