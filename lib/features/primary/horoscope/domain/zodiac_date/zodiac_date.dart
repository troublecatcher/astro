import 'package:hive_flutter/hive_flutter.dart';

part 'zodiac_date.g.dart';

@HiveType(typeId: 0)
class ZodiacDate {
  @HiveField(0)
  final int month;
  @HiveField(1)
  final int day;

  const ZodiacDate({required this.month, required this.day});

  int compareTo(ZodiacDate other) {
    if (month == other.month) {
      return day.compareTo(other.day);
    }
    return month.compareTo(other.month);
  }

  factory ZodiacDate.fromDateTime(DateTime dateTime) {
    return ZodiacDate(month: dateTime.month, day: dateTime.day);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ZodiacDate && other.month == month && other.day == day;
  }

  @override
  int get hashCode => Object.hash(month, day);
}
