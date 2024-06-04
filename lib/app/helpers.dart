import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:intl/intl.dart';

class Helpers {
  static String apiDateFormat(DateTime dateTime) {
    return DateFormat('MMM d, yyyy').format(dateTime);
  }
}

int calculateAge(DateTime birthDate) {
  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;

  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}

String profileInfo(Profile profile) {
  return '${calculateAge(profile.dateOfBirth)} y.o., ${profile.placeOfBirth}';
}
