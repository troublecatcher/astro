import 'package:astro/features/primary/horoscope/domain/zodiac_date/zodiac_date.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'zodiac_sign.g.dart';

@HiveType(typeId: 1)
class ZodiacSign {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String titleRU;
  @HiveField(2)
  final String assetName;
  @HiveField(3)
  final ZodiacDate from;
  @HiveField(4)
  final ZodiacDate to;

  ZodiacSign({
    required this.title,
    required this.titleRU,
    required this.from,
    required this.to,
  }) : assetName = 'assets/zodiac_signs/$title.svg';

  bool containsDate(ZodiacDate date) {
    return (date.month == from.month && date.day >= from.day) ||
        (date.month == to.month && date.day <= to.day);
  }

  static ZodiacSign determineZodiacSign(DateTime date) {
    final zodiacDate = ZodiacDate.fromDateTime(date);
    return zodiacSigns.firstWhere((sign) => sign.containsDate(zodiacDate));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ZodiacSign &&
        other.title == title &&
        other.titleRU == titleRU &&
        other.assetName == assetName &&
        other.from == from &&
        other.to == to;
  }

  @override
  int get hashCode => Object.hash(title, titleRU, assetName, from, to);

  static final List<ZodiacSign> zodiacSigns = [
    ZodiacSign(
      title: 'aquarius',
      titleRU: 'Водолей',
      from: const ZodiacDate(month: 1, day: 20),
      to: const ZodiacDate(month: 2, day: 18),
    ),
    ZodiacSign(
      title: 'pisces',
      titleRU: 'Рыбы',
      from: const ZodiacDate(month: 2, day: 19),
      to: const ZodiacDate(month: 3, day: 20),
    ),
    ZodiacSign(
      title: 'aries',
      titleRU: 'Овен',
      from: const ZodiacDate(month: 3, day: 21),
      to: const ZodiacDate(month: 4, day: 19),
    ),
    ZodiacSign(
      title: 'taurus',
      titleRU: 'Телец',
      from: const ZodiacDate(month: 4, day: 20),
      to: const ZodiacDate(month: 5, day: 20),
    ),
    ZodiacSign(
      title: 'gemini',
      titleRU: 'Близнецы',
      from: const ZodiacDate(month: 5, day: 21),
      to: const ZodiacDate(month: 6, day: 20),
    ),
    ZodiacSign(
      title: 'cancer',
      titleRU: 'Рак',
      from: const ZodiacDate(month: 6, day: 21),
      to: const ZodiacDate(month: 7, day: 22),
    ),
    ZodiacSign(
      title: 'leo',
      titleRU: 'Лев',
      from: const ZodiacDate(month: 7, day: 23),
      to: const ZodiacDate(month: 8, day: 22),
    ),
    ZodiacSign(
      title: 'virgo',
      titleRU: 'Дева',
      from: const ZodiacDate(month: 8, day: 23),
      to: const ZodiacDate(month: 9, day: 22),
    ),
    ZodiacSign(
      title: 'libra',
      titleRU: 'Весы',
      from: const ZodiacDate(month: 9, day: 23),
      to: const ZodiacDate(month: 10, day: 22),
    ),
    ZodiacSign(
      title: 'scorpio',
      titleRU: 'Скорпион',
      from: const ZodiacDate(month: 10, day: 23),
      to: const ZodiacDate(month: 11, day: 21),
    ),
    ZodiacSign(
      title: 'sagittarius',
      titleRU: 'Стрелец',
      from: const ZodiacDate(month: 11, day: 22),
      to: const ZodiacDate(month: 12, day: 21),
    ),
    ZodiacSign(
      title: 'capricorn',
      titleRU: 'Козерог',
      from: const ZodiacDate(month: 12, day: 22),
      to: const ZodiacDate(month: 1, day: 19),
    ),
  ];
}
