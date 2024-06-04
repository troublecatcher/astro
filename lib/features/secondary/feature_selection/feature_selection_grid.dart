import 'package:astro/features/secondary/feature_selection/feature_selection_card.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeatureSelectionGrid extends StatelessWidget {
  const FeatureSelectionGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 355.w,
        height: 495.h,
        child: AnimationLimiter(
          child: GridView.count(
            mainAxisSpacing: 25.r,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              FeatureSelectionCard(
                position: 0,
                assetName: 'assets/features/horoscopes/card.png',
                onPressed: () => context
                    .read<FeatureSelectionCubit>()
                    .set(FeatureState.horoscopes),
              ),
              FeatureSelectionCard(
                position: 1,
                assetName: 'assets/features/palmistry.png',
                onPressed: () => context
                    .read<FeatureSelectionCubit>()
                    .set(FeatureState.palmistry),
              ),
              FeatureSelectionCard(
                position: 2,
                assetName: 'assets/features/tarot.png',
                onPressed: () => context
                    .read<FeatureSelectionCubit>()
                    .set(FeatureState.tarot),
              ),
              FeatureSelectionCard(
                position: 3,
                assetName: 'assets/features/natal.png',
                onPressed: () => context
                    .read<FeatureSelectionCubit>()
                    .set(FeatureState.natal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
