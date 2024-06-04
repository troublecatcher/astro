import 'package:astro/features/primary/horoscope/domain/horoscope/models/horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'weekly_horoscope.g.dart';

@HiveType(typeId: 4)
class WeeklyHoroscope extends Horoscope {
  @HiveField(0)
  final String horoscopeData;
  @HiveField(1)
  final ZodiacSign sign;
  @HiveField(2)
  final String week;

  WeeklyHoroscope({
    required this.horoscopeData,
    required this.sign,
    required this.week,
  });

  factory WeeklyHoroscope.fromJson(Map<String, dynamic> json, ZodiacSign sign) {
    return WeeklyHoroscope(
      horoscopeData: json['data']['horoscope_data'],
      sign: sign,
      week: json['data']['week'],
    );
  }
}
