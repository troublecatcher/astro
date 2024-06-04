import 'package:astro/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoroscopeFailedWidget extends StatelessWidget {
  final String error;
  const HoroscopeFailedWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      decoration: BoxDecoration(
        color: color3,
        borderRadius: br10,
      ),
      child: Column(
        children: [
          Text(error),
        ],
      ),
    );
  }
}
