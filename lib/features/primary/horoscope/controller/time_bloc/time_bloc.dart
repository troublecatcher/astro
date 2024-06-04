import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_daily_mode.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_frequency.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final HoroscopeCubit horoscopeCubit;
  TimeBloc({required this.horoscopeCubit}) : super(const TimeDailyToday()) {
    on<TimeSetFrequency>((event, emit) async {
      switch (event.frequency) {
        case HoroscopeFrequency.daily:
          emit(const TimeDailyToday());
          horoscopeCubit.setLoadingState();
          await horoscopeCubit.getDailyInitial();
          break;
        case HoroscopeFrequency.weekly:
          emit(const TimeWeekly());
          horoscopeCubit.setLoadingState();
          await horoscopeCubit.getWeekly();
          break;
        case HoroscopeFrequency.monthly:
          emit(const TimeMonthly());
          horoscopeCubit.setLoadingState();
          await horoscopeCubit.getMonthly();
          break;
      }
    });
    on<TimeSetDailyMode>((event, emit) async {
      switch (event.dailyMode) {
        case HoroscopeDailyMode.yesterday:
          await goBackFromDailyModeOtherIfNeeded();
          emit(const TimeDailyYesterday());
          break;
        case HoroscopeDailyMode.today:
          await goBackFromDailyModeOtherIfNeeded();
          emit(const TimeDailyToday());
          break;
        case HoroscopeDailyMode.tomorrow:
          await goBackFromDailyModeOtherIfNeeded();
          emit(const TimeDailyTomorrow());
          break;
        case HoroscopeDailyMode.other:
          horoscopeCubit.setLoadingState();
          await horoscopeCubit.getDailyByDate(event.dateTime!);
          emit(TimeDailyOther(dateTime: event.dateTime!));
          break;
      }
    });
  }

  Future<void> goBackFromDailyModeOtherIfNeeded() async {
    if (state is TimeDailyOther) {
      horoscopeCubit.setLoadingState();
      await horoscopeCubit.getDailyInitial();
    }
  }
}
