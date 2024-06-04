import 'package:astro/app/theme.dart';
import 'package:astro/features/primary/horoscope/controller/horoscope_cubit/horoscope_cubit.dart';
import 'package:astro/features/primary/horoscope/controller/time_bloc/time_bloc.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_daily_mode.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_frequency.dart';
import 'package:astro/features/primary/horoscope/view/widget/bordered_chip.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_page_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HoroscopeDailyModeSelector extends StatelessWidget {
  const HoroscopeDailyModeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            HoroscopeDailyMode.values.length,
            (index) {
              late Function() onPressed;
              late String title;
              final dailyMode = HoroscopeDailyMode.values[index];
              if (dailyMode == HoroscopeDailyMode.other) {
                onPressed = () async {
                  final now = DateTime.now();
                  final newDateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: now.subtract(const Duration(days: 2)),
                  );
                  if (newDateTime != null) {
                    context.read<TimeBloc>().add(
                          TimeSetDailyMode(
                            dailyMode: dailyMode,
                            dateTime: newDateTime,
                          ),
                        );
                  }
                };
                final st = context.read<TimeBloc>().state;
                if (st is TimeDailyOther) {
                  title = DateFormat('dd.MM.yyyy').format(st.dateTime);
                } else {
                  title = toBeginningOfSentenceCase(dailyMode.name);
                }
              } else {
                onPressed = () {
                  context.read<TimeBloc>().add(
                        TimeSetDailyMode(
                          dailyMode: dailyMode,
                        ),
                      );
                };
                title = toBeginningOfSentenceCase(dailyMode.name);
              }
              return BorderedChip(
                title: title,
                gradient: gradient3,
                active: dailyMode == state.dailyMode,
                onPressed: state is! TimeWeekly && (state is! TimeMonthly)
                    ? () {
                        if (dailyMode != state.dailyMode) {
                          onPressed();
                        }
                      }
                    : null,
                style: horoscopeBorderedChipTextStyle.copyWith(fontSize: 14.sp),
              );
            },
          ),
        );
      },
    );
  }
}
