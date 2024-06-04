import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'profile.g.dart';

@HiveType(typeId: 2)
class Profile {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime dateOfBirth;
  @HiveField(2)
  final String placeOfBirth;
  @HiveField(3)
  final ZodiacSign zodiacSign;

  Profile({
    required this.name,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.zodiacSign,
  });
}
