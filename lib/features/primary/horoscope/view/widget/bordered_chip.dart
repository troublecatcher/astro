import 'package:astro/app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderedChip extends StatelessWidget {
  final String title;
  final LinearGradient gradient;
  final bool active;
  final VoidCallback? onPressed;
  final TextStyle style;
  const BorderedChip({
    super.key,
    required this.title,
    required this.gradient,
    required this.active,
    required this.onPressed,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            gradient: active ? gradient : null,
            border:
                Border.all(color: active ? Colors.transparent : borderColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}
