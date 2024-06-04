import 'package:astro/features/primary/horoscope/domain/horoscope/models/daily_horoscope/daily_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/monthly_horoscope/monthly_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/weekly_horoscope/weekly_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_date/zodiac_date.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ZodiacDateAdapter());
  Hive.registerAdapter(ZodiacSignAdapter());
  Hive.registerAdapter(ProfileAdapter());
  profileBox = await Hive.openBox('profileBox');
  // profileBox.clear();
}
