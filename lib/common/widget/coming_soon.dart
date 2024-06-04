import 'package:astro/app/theme.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String title;
  const ComingSoon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color3,
          borderRadius: br10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const Text('coming soon!'),
          ],
        ),
      ),
    );
  }
}
