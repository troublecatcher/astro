part of 'horoscope_cubit.dart';

@immutable
sealed class HoroscopeState {
  final List<Horoscope> horoscopes;

  const HoroscopeState(this.horoscopes);
}

final class HoroscopeInitial extends HoroscopeState {
  const HoroscopeInitial(super.horoscopes);
}

final class HoroscopeLoading extends HoroscopeState {
  const HoroscopeLoading(super.horoscopes);
}

final class HoroscopeDidLoad extends HoroscopeState {
  const HoroscopeDidLoad(super.horoscopes);
}

final class HoroscopeFailed extends HoroscopeState {
  final String error;
  final String stackTrace;

  const HoroscopeFailed(
    super.horoscopes, {
    required this.error,
    required this.stackTrace,
  });
}
