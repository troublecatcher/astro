import 'package:astro/features/primary/horoscope/domain/horoscope/models/horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'monthly_horoscope.g.dart';

@HiveType(typeId: 5)
class MonthlyHoroscope extends Horoscope {
  @HiveField(0)
  final String horoscopeData;
  @HiveField(1)
  final ZodiacSign sign;
  @HiveField(2)
  final String month;
  @HiveField(3)
  final String challengingDays;
  @HiveField(4)
  final String standoutDays;

  MonthlyHoroscope({
    required this.horoscopeData,
    required this.sign,
    required this.month,
    required this.challengingDays,
    required this.standoutDays,
  });

  factory MonthlyHoroscope.fromJson(
      Map<String, dynamic> json, ZodiacSign sign) {
    return MonthlyHoroscope(
      horoscopeData: json['data']['horoscope_data'],
      sign: sign,
      month: json['data']['month'],
      challengingDays: json['data']['challenging_days'],
      standoutDays: json['data']['standout_days'],
    );
  }
}
