// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_horoscope.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyHoroscopeAdapter extends TypeAdapter<DailyHoroscope> {
  @override
  final int typeId = 3;

  @override
  DailyHoroscope read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyHoroscope(
      horoscopeData: fields[0] as String,
      sign: fields[1] as ZodiacSign,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyHoroscope obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.horoscopeData)
      ..writeByte(1)
      ..write(obj.sign)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyHoroscopeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
