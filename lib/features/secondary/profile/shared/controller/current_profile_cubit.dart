import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/main.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentProfileCubit extends Cubit<Profile?> {
  CurrentProfileCubit() : super(null) {
    get();
  }

  get() => di<SharedPreferences>().getInt('profile');

  set(Profile profile, int index) async {
    await di<SharedPreferences>().setInt('profile', index);
    emit(profile);
  }
}
