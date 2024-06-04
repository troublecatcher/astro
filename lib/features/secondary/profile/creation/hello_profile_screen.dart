import 'package:astro/app/theme.dart';
import 'package:astro/common/layout/base_screen.dart';
import 'package:astro/features/secondary/profile/shared/controller/profile_list_cubit.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/features/secondary/profile/creation/profile_creation_widget.dart';
import 'package:astro/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HelloProfileScreen extends StatelessWidget {
  const HelloProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      background: Background.main,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome!',
            style: horoscopeDayTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 33.h),
          ProfileCreationWidget(
            title: Text(
              'Create your first ASTRO-profile here',
              style: horoscopeTextStyle,
              textAlign: TextAlign.center,
            ),
            onDone: (Profile profile) async {
              await di<SharedPreferences>().setBool('isFirstTime', false);
              await context
                  .read<ProfileListCubit>()
                  .create(profile, setCurrent: true);
              context.router.replaceNamed('/main/home');
            },
          ),
        ],
      ),
    );
  }
}
