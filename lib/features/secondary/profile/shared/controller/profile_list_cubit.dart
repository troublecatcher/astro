import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListCubit extends Cubit<List<Profile>> {
  final CurrentProfileCubit cubit;
  ProfileListCubit(this.cubit) : super([]) {
    read();
  }

  Future<int> create(Profile profile, {required bool setCurrent}) async {
    final index = await profileBox.add(profile);
    emit([...state, profile]);
    if (setCurrent) {
      cubit.set(profile, index);
    }
    return index;
  }

  void read() {
    List<Profile> profileList = [];
    if (profileBox.isNotEmpty) {
      for (var i = 0; i < profileBox.length; i++) {
        final profile = profileBox.getAt(i)!;
        profileList.add(profile);
      }
      emit(profileList);
      final index = cubit.get();
      cubit.set(profileList[index!], index);
    } else {
      emit([]);
    }
  }

  void update(int index, Profile profile) {
    profileBox.putAt(index, profile).whenComplete(() {
      final List<Profile> updatedList = List.from(state);
      updatedList[index] = profile;
      emit(updatedList);
    });
  }

  Future<void> delete(int index) async {
    await profileBox.deleteAt(index);
    final List<Profile> updatedList = List.from(state);
    updatedList.removeAt(index);
    emit(updatedList);
  }
}
