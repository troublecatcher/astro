import 'package:astro/app/helpers.dart';
import 'package:astro/app/theme.dart';
import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/features/secondary/profile/shared/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureSelectionProfileWidget extends StatelessWidget {
  const FeatureSelectionProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentProfileCubit, Profile?>(
      builder: (context, profile) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 100.h),
          height: 132.h,
          width: 330.w,
          child: ProfileWidget(
            profile: profile!,
            name: Text(
              profile.name,
              style: horoscopeDayTextStyle.copyWith(fontSize: 18.sp),
            ),
            info: Text(
              profileInfo(profile),
              style: horoscopeDayTextStyle,
            ),
          ),
        );
      },
    );
  }
}
