import 'package:astro/app/theme.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/features/secondary/profile/selection/profile_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWidget extends StatelessWidget {
  final Widget name;
  final Widget info;
  const ProfileWidget({
    super.key,
    required this.profile,
    required this.name,
    required this.info,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(profile.zodiacSign.assetName),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [name, info],
          ),
        ),
      ],
    );
  }
}
