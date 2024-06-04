import 'package:astro/features/primary/horoscope/domain/horoscope/models/horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'daily_horoscope.g.dart';

@HiveType(typeId: 3)
class DailyHoroscope extends Horoscope {
  @HiveField(0)
  final String horoscopeData;
  @HiveField(1)
  final ZodiacSign sign;
  @HiveField(3)
  final String date;

  DailyHoroscope({
    required this.horoscopeData,
    required this.sign,
    required this.date,
  });

  factory DailyHoroscope.fromJson(Map<String, dynamic> json, ZodiacSign sign) {
    return DailyHoroscope(
      horoscopeData: json['data']['horoscope_data'],
      sign: sign,
      date: json['data']['date'],
    );
  }
}
