import 'package:astro/app/router/navbar_screen.dart';
import 'package:astro/common/layout/base_screen.dart';
import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/controller/time_bloc/time_bloc.dart';
import 'package:astro/features/primary/natal/natal_view.dart';
import 'package:astro/features/primary/palmistry/palmistry_view.dart';
import 'package:astro/features/primary/tarot/tarot_view.dart';
import 'package:astro/features/primary/horoscope/view/layout/horoscope_view.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_cubit.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_grid.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_profile_widget.dart';
import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_animation/hero_animation.dart';

@RoutePage()
class FeatureSelectionScreen extends StatefulWidget {
  const FeatureSelectionScreen({super.key});

  @override
  State<FeatureSelectionScreen> createState() => _FeatureSelectionScreenState();
}

class _FeatureSelectionScreenState extends State<FeatureSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      background: Background.special,
      child: HeroAnimationScene(
        duration: Durations.medium4,
        curve: Curves.easeIn,
        child: BlocBuilder<FeatureSelectionCubit, FeatureState>(
          builder: (context, featureState) {
            return Stack(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: FeatureSelectionProfileWidget(),
                ),
                switch (featureState) {
                  FeatureState.main => const FeatureSelectionGrid(),
                  FeatureState.horoscopes => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => HoroscopeCubit(
                            profileCubit: context.read<CurrentProfileCubit>(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => TimeBloc(
                            horoscopeCubit: context.read<HoroscopeCubit>(),
                          ),
                        ),
                      ],
                      child: const HoroscopeView(),
                    ),
                  FeatureState.palmistry => const PalmistryView(),
                  FeatureState.tarot => const TarotView(),
                  FeatureState.natal => const NatalView(),
                },
                if (featureState != FeatureState.main)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context
                            .read<FeatureSelectionCubit>()
                            .set(FeatureState.main),
                        child: const CustomIcon(
                          assetName: 'misc/menu.svg',
                          active: true,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
