import 'package:astro/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HoroscopeGradientTitle extends StatelessWidget {
  final String title;
  const HoroscopeGradientTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GradientText(
      title,
      style: horoscopeDayTextStyle,
      colors: const [color3, color1],
      textAlign: TextAlign.center,
    );
  }
}
