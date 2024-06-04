import 'package:astro/common/layout/primary_feature_base_view.dart';
import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/controller/time_bloc/time_bloc.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_frequency.dart';
import 'package:astro/features/primary/horoscope/view/layout/horoscope_cards.dart';
import 'package:astro/features/primary/horoscope/view/layout/horoscope_placeholder.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_daily_mode_selector.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_failed_widget.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_frequency_selector.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_page_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoroscopeView extends StatefulWidget {
  const HoroscopeView({
    super.key,
  });

  @override
  State<HoroscopeView> createState() => _HoroscopeViewState();
}

class _HoroscopeViewState extends State<HoroscopeView> {
  @override
  void initState() {
    super.initState();
    context.read<HoroscopeCubit>().getDailyInitial();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoroscopeCubit, HoroscopeState>(
      builder: (context, horoscopeState) {
        return BlocBuilder<TimeBloc, TimeState>(
          builder: (context, timeState) {
            return PrimaryFeatureBaseView(
              children: [
                const HoroscopeFrequencySelector(),
                SizedBox(height: 16.h),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final a = CurvedAnimation(
                        parent: animation, curve: Curves.easeOut);
                    return SizeTransition(sizeFactor: a, child: child);
                  },
                  child: timeState.frequency == HoroscopeFrequency.daily &&
                          horoscopeState is HoroscopeDidLoad
                      ? const HoroscopeDailyModeSelector(
                          key: ValueKey('dailyModeSelector'),
                        )
                      : Container(
                          key: const ValueKey('emptyContainer'),
                        ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 500.h,
                  child: HoroscopeCards(
                    horoscopes: horoscopeState.horoscopes,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
