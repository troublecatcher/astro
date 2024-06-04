import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExistingHoroscopeCardBase extends StatelessWidget {
  final Widget child;
  const ExistingHoroscopeCardBase({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            child,
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
