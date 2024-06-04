import 'package:flutter/material.dart';

enum Background { main, special }

class BaseScreen extends StatelessWidget {
  final Background background;
  final Widget child;
  const BaseScreen({super.key, required this.background, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(switch (background) {
              Background.main => 'assets/common/bg1.png',
              Background.special => 'assets/common/bg2.png',
            }),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
