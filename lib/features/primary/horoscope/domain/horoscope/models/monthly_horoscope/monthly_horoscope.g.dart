// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_horoscope.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonthlyHoroscopeAdapter extends TypeAdapter<MonthlyHoroscope> {
  @override
  final int typeId = 5;

  @override
  MonthlyHoroscope read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MonthlyHoroscope(
      horoscopeData: fields[0] as String,
      sign: fields[1] as ZodiacSign,
      month: fields[2] as String,
      challengingDays: fields[3] as String,
      standoutDays: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MonthlyHoroscope obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.horoscopeData)
      ..writeByte(1)
      ..write(obj.sign)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.challengingDays)
      ..writeByte(4)
      ..write(obj.standoutDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthlyHoroscopeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
