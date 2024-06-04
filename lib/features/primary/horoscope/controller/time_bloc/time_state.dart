part of 'time_bloc.dart';

@immutable
sealed class TimeState {
  final HoroscopeFrequency frequency;
  final HoroscopeDailyMode? dailyMode;

  const TimeState({required this.frequency, this.dailyMode});
}

final class TimeDailyYesterday extends TimeState {
  const TimeDailyYesterday({
    super.frequency = HoroscopeFrequency.daily,
    super.dailyMode = HoroscopeDailyMode.yesterday,
  });
}

final class TimeDailyToday extends TimeState {
  const TimeDailyToday({
    super.frequency = HoroscopeFrequency.daily,
    super.dailyMode = HoroscopeDailyMode.today,
  });
}

final class TimeDailyTomorrow extends TimeState {
  const TimeDailyTomorrow({
    super.frequency = HoroscopeFrequency.daily,
    super.dailyMode = HoroscopeDailyMode.tomorrow,
  });
}

final class TimeDailyOther extends TimeState {
  final DateTime dateTime;

  const TimeDailyOther({
    super.frequency = HoroscopeFrequency.daily,
    super.dailyMode = HoroscopeDailyMode.other,
    required this.dateTime,
  });
}

final class TimeWeekly extends TimeState {
  const TimeWeekly({
    super.frequency = HoroscopeFrequency.weekly,
  });
}

final class TimeMonthly extends TimeState {
  const TimeMonthly({
    super.frequency = HoroscopeFrequency.monthly,
  });
}
