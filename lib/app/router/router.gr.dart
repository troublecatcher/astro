// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FeatureSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeatureSelectionScreen(),
      );
    },
    HelloProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelloProfileScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NavbarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavbarScreen(),
      );
    },
    ProfileSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileSelectionScreen(),
      );
    },
  };
}

/// generated route for
/// [FeatureSelectionScreen]
class FeatureSelectionRoute extends PageRouteInfo<void> {
  const FeatureSelectionRoute({List<PageRouteInfo>? children})
      : super(
          FeatureSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeatureSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelloProfileScreen]
class HelloProfileRoute extends PageRouteInfo<void> {
  const HelloProfileRoute({List<PageRouteInfo>? children})
      : super(
          HelloProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelloProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavbarScreen]
class NavbarRoute extends PageRouteInfo<void> {
  const NavbarRoute({List<PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileSelectionScreen]
class ProfileSelectionRoute extends PageRouteInfo<void> {
  const ProfileSelectionRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
