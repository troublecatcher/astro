part of 'time_bloc.dart';

@immutable
sealed class TimeEvent {}

final class TimeSetFrequency extends TimeEvent {
  final HoroscopeFrequency frequency;

  TimeSetFrequency({required this.frequency});
}

final class TimeSetDailyMode extends TimeEvent {
  final HoroscopeDailyMode dailyMode;
  final DateTime? dateTime;

  TimeSetDailyMode({required this.dailyMode, this.dateTime});
}
