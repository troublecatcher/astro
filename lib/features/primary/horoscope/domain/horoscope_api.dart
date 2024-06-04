import 'dart:convert';
import 'package:astro/app/helpers.dart';
import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/daily_horoscope/daily_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/monthly_horoscope/monthly_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/weekly_horoscope/weekly_horoscope.dart';
import 'package:astro/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:intl/intl.dart';

class HoroscopeApi {
  final String baseUrl =
      'https://horoscope-app-api.vercel.app/api/v1/get-horoscope';

  Future<Map<String, dynamic>> _fetchData(String endpoint) async {
    const proxy = 'https://cors-anywhere.herokuapp.com';
    final url = '$proxy/$baseUrl/$endpoint';
    // final url = '$baseUrl/$endpoint';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load horoscope');
    }
  }

  Future<DailyHoroscope> fetchDailyByDate(
      ZodiacSign sign, DateTime dateTime) async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(DailyHoroscopeAdapter());
    }
    dailyHoroscopeBox = await Hive.openBox('dailyHoroscopeBox');
    final date = Helpers.apiDateFormat(dateTime);
    final string = '$date - ${sign.title}';
    final cachedHoroscope = dailyHoroscopeBox.get(string);
    if (cachedHoroscope != null) {
      return cachedHoroscope;
    } else {
      final fSign = sign.title;
      final fDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final json = await _fetchData('daily?sign=$fSign&day=$fDate');
      final horoscope = DailyHoroscope.fromJson(json, sign);
      await dailyHoroscopeBox.put(string, horoscope);
      return horoscope;
    }
  }

  Future<DailyHoroscope> fetchDailyByWord(ZodiacSign sign, DayWord word) async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(DailyHoroscopeAdapter());
    }
    dailyHoroscopeBox = await Hive.openBox('dailyHoroscopeBox');
    DateTime day = DateTime.now();
    switch (word) {
      case DayWord.yesterday:
        day = day.subtract(const Duration(days: 1));
        break;
      case DayWord.today:
        break;
      case DayWord.tomorrow:
        day = day.add(const Duration(days: 1));
        break;
    }
    final fDay = Helpers.apiDateFormat(day);
    final string = '$fDay - ${sign.title}';
    final cachedHoroscope = dailyHoroscopeBox.get(string);
    if (cachedHoroscope != null) {
      return cachedHoroscope;
    } else {
      final json =
          await _fetchData('daily?sign=${sign.title}&day=${word.name}');
      final horoscope = DailyHoroscope.fromJson(json, sign);
      if (word == DayWord.tomorrow &&
          horoscope.date ==
              Helpers.apiDateFormat(day.subtract(const Duration(days: 1)))) {
        return DailyHoroscope(
          horoscopeData: 'No data for tomorrow yet',
          sign: sign,
          date: fDay,
        );
      }
      final s = '${horoscope.date} - ${sign.title}';
      await dailyHoroscopeBox.put(s, horoscope);
      return horoscope;
    }
  }

  Future<WeeklyHoroscope> fetchWeekly(ZodiacSign sign) async {
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(WeeklyHoroscopeAdapter());
    }
    weeklyHoroscopeBox = await Hive.openBox('weeklyHoroscopeBox');
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final sunday = monday.add(const Duration(days: 6));
    final fMonday = Helpers.apiDateFormat(monday);
    final fSunday = Helpers.apiDateFormat(sunday);
    final week = '$fMonday - $fSunday';
    final cachedHoroscope = weeklyHoroscopeBox.get(sign.title);
    if (cachedHoroscope != null && cachedHoroscope.week == week) {
      return cachedHoroscope;
    } else {
      final fSign = sign.title;
      final json = await _fetchData('weekly?sign=$fSign');
      final horoscope = WeeklyHoroscope.fromJson(json, sign);
      await weeklyHoroscopeBox.put(sign.title, horoscope);
      return horoscope;
    }
  }

  Future<MonthlyHoroscope> fetchMonthly(ZodiacSign sign) async {
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(MonthlyHoroscopeAdapter());
    }
    monthlyHoroscopeBox = await Hive.openBox('monthlyHoroscopeBox');
    final now = DateTime.now();
    final month = DateFormat('MMMM yyyy').format(now);
    final cachedHoroscope = monthlyHoroscopeBox.get(sign.title);
    if (cachedHoroscope != null && cachedHoroscope.month == month) {
      return cachedHoroscope;
    } else {
      final fSign = sign.title;
      final json = await _fetchData('monthly?sign=$fSign');
      final horoscope = MonthlyHoroscope.fromJson(json, sign);
      await monthlyHoroscopeBox.put(sign.title, horoscope);
      return horoscope;
    }
  }
}
