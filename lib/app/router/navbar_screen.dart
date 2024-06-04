import 'package:astro/app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: Duration.zero,
      backgroundColor: Colors.black,
      routes: const [
        HomeRoute(),
        FeatureSelectionRoute(),
        ProfileSelectionRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(4, 9, 34, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) => tabsRouter.setActiveIndex(value),
          items: const [
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetName: 'assets/navbar/home.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetName: 'assets/navbar/home.svg',
                active: true,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetName: 'assets/navbar/feature_selection.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetName: 'assets/navbar/feature_selection.svg',
                active: true,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetName: 'assets/navbar/profile.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetName: 'assets/navbar/profile.svg',
                active: true,
              ),
              label: '',
            ),
          ],
        );
      },
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String assetName;
  final bool active;
  final double? side;
  const CustomIcon({
    super.key,
    required this.assetName,
    required this.active,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: side ?? 28.r,
      height: side ?? 28.r,
      child: SvgPicture.asset(
        assetName,
        colorFilter: ColorFilter.mode(
          active ? Colors.transparent : Colors.grey.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
