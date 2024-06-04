import 'package:astro/common/layout/base_screen.dart';
import 'package:astro/common/widget/coming_soon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      background: Background.main,
      child: ComingSoon(title: 'Home screen'),
    );
  }
}
