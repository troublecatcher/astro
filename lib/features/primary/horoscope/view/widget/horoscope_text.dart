import 'package:astro/app/theme.dart';
import 'package:flutter/material.dart';

class HoroscopeText extends StatelessWidget {
  final String text;
  const HoroscopeText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: horoscopeTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
