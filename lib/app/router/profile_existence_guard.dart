import 'package:astro/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileExistenceGuard extends AutoRouteGuard {
  final ProfileExistenceGuardCheck checkIf;
  final PageRouteInfo otherwiseRedirectTo;

  ProfileExistenceGuard(
      {required this.checkIf, required this.otherwiseRedirectTo});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
    late bool condition;
    switch (checkIf) {
      case ProfileExistenceGuardCheck.profileDoesNotExist:
        condition = isFirstTime!;
        break;
      case ProfileExistenceGuardCheck.profileExists:
        condition = !isFirstTime!;
        break;
    }
    if (condition) {
      resolver.next(true);
    } else {
      resolver.redirect(otherwiseRedirectTo);
    }
  }
}

enum ProfileExistenceGuardCheck { profileExists, profileDoesNotExist }
