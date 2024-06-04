import 'package:astro/features/primary/horoscope/domain/horoscope/models/horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/loading_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope_api.dart';
import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'horoscope_state.dart';

enum DayWord { yesterday, today, tomorrow }

class HoroscopeCubit extends Cubit<HoroscopeState> {
  final CurrentProfileCubit profileCubit;
  HoroscopeCubit({required this.profileCubit})
      : super(
            HoroscopeInitial(List.generate(3, (index) => LoadingHoroscope())));

  final _api = HoroscopeApi();

  setLoadingState() =>
      emit(HoroscopeLoading(List.generate(3, (index) => LoadingHoroscope())));

  Future<void> getDailyInitial() async {
    tryFetch(() async {
      final sign = _getSign();
      List<Horoscope> horoscopes = [];
      await Future.wait(
        [
          _api.fetchDailyByWord(sign, DayWord.yesterday),
          _api.fetchDailyByWord(sign, DayWord.today),
          _api.fetchDailyByWord(sign, DayWord.tomorrow),
        ],
      ).then((value) => horoscopes = value);
      emit(HoroscopeDidLoad(horoscopes));
    });
  }

  Future<void> getDailyByDate(DateTime dateTime) async {
    tryFetch(() async {
      final dailyHoroscope = await _api.fetchDailyByDate(_getSign(), dateTime);
      emit(HoroscopeDidLoad([dailyHoroscope]));
    });
  }

  Future<void> getMonthly() async {
    tryFetch(() async {
      final monthlyHoroscope = await _api.fetchMonthly(_getSign());
      emit(HoroscopeDidLoad([monthlyHoroscope]));
    });
  }

  Future<void> getWeekly() async {
    tryFetch(() async {
      final weeklyHoroscope = await _api.fetchWeekly(_getSign());
      emit(HoroscopeDidLoad([weeklyHoroscope]));
    });
  }

  void tryFetch(VoidCallback callback) {
    try {
      callback();
    } catch (e, st) {
      emit(HoroscopeFailed(const [],
          error: e.toString(), stackTrace: st.toString()));
    }
  }

  _getSign() => profileCubit.state!.zodiacSign;
}
