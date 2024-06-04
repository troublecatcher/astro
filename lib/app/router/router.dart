import 'package:astro/app/router/navbar_screen.dart';
import 'package:astro/app/router/profile_existence_guard.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_screen.dart';
import 'package:astro/features/secondary/home/home_screen.dart';
import 'package:astro/features/secondary/profile/creation/hello_profile_screen.dart';
import 'package:astro/features/secondary/profile/selection/profile_selection_screen.dart';
import 'package:astro/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
    return [
      AutoRoute(
        path: '/main',
        page: NavbarRoute.page,
        initial: !isFirstTime!,
        guards: [
          ProfileExistenceGuard(
            checkIf: ProfileExistenceGuardCheck.profileExists,
            otherwiseRedirectTo: const HelloProfileRoute(),
          )
        ],
        children: [
          AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
          AutoRoute(page: FeatureSelectionRoute.page, path: 'features'),
          AutoRoute(page: ProfileSelectionRoute.page, path: 'profile'),
        ],
      ),
      AutoRoute(
        page: HelloProfileRoute.page,
        initial: isFirstTime,
        path: '/hello',
        guards: [
          ProfileExistenceGuard(
            checkIf: ProfileExistenceGuardCheck.profileDoesNotExist,
            otherwiseRedirectTo: const NavbarRoute(),
          )
        ],
      ),
    ];
  }
}
