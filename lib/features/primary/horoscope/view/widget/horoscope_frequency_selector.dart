import 'package:astro/app/theme.dart';
import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/controller/time_bloc/time_bloc.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_frequency.dart';
import 'package:astro/features/primary/horoscope/view/widget/bordered_chip.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_page_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HoroscopeFrequencySelector extends StatelessWidget {
  const HoroscopeFrequencySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoroscopeCubit, HoroscopeState>(
      builder: (context, horoscopeState) {
        return BlocBuilder<TimeBloc, TimeState>(
          builder: (context, timeState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                HoroscopeFrequency.values.length,
                (index) {
                  final frequency = HoroscopeFrequency.values[index];
                  return BorderedChip(
                    title: toBeginningOfSentenceCase(frequency.name),
                    gradient: gradient2,
                    active: frequency == timeState.frequency,
                    onPressed: horoscopeState is HoroscopeLoading
                        ? null
                        : () {
                            if (frequency != timeState.frequency) {
                              context
                                  .read<TimeBloc>()
                                  .add(TimeSetFrequency(frequency: frequency));
                            }
                          },
                    style: horoscopeBorderedChipTextStyle.copyWith(
                        fontSize: 16.sp),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
