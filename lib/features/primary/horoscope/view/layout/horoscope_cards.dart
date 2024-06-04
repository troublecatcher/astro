import 'package:astro/app/theme.dart';
import 'package:astro/features/primary/horoscope/controller/time_bloc/time_bloc.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/horoscope_daily_mode.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/daily_horoscope/daily_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/loading_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/monthly_horoscope/monthly_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/weekly_horoscope/weekly_horoscope.dart';
import 'package:astro/features/primary/horoscope/view/widget/existing_horoscope_card_base.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_gradient_title.dart';
import 'package:astro/features/primary/horoscope/view/widget/horoscope_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HoroscopeCards extends StatelessWidget {
  final List<Horoscope> horoscopes;
  HoroscopeCards({
    super.key,
    required this.horoscopes,
  });

  final pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimeBloc, TimeState>(
      listener: (context, state) {
        if (state is! TimeWeekly && state is! TimeMonthly) {
          switch (state) {
            case TimeDailyYesterday _:
              goToPage(0);
            case TimeDailyToday _:
              goToPage(1);
            case TimeDailyTomorrow _:
              goToPage(2);
            default:
          }
        }
      },
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: horoscopes
            .map((incomingHoroscope) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/features/horoscopes/frame.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      switch (incomingHoroscope) {
                        case DailyHoroscope _:
                          final horoscope = incomingHoroscope;
                          final parsedDate =
                              DateFormat('MMM d, yyyy').parse(horoscope.date);
                          final day = DateFormat('d').format(parsedDate);
                          final month = DateFormat('MMM').format(parsedDate);
                          return ExistingHoroscopeCardBase(
                            child: Column(
                              children: [
                                HoroscopeGradientTitle(title: day),
                                Text(
                                  month.toUpperCase(),
                                  style: horoscopeDayTextStyle,
                                ),
                                HoroscopeText(text: horoscope.horoscopeData),
                              ],
                            ),
                          );
                        case WeeklyHoroscope _:
                          final horoscope = incomingHoroscope;
                          return ExistingHoroscopeCardBase(
                              child: Column(
                            children: [
                              HoroscopeGradientTitle(title: horoscope.week),
                              HoroscopeText(text: horoscope.horoscopeData),
                            ],
                          ));
                        case MonthlyHoroscope _:
                          final horoscope = incomingHoroscope;
                          return ExistingHoroscopeCardBase(
                              child: Column(
                            children: [
                              HoroscopeGradientTitle(title: horoscope.month),
                              HoroscopeText(text: horoscope.horoscopeData),
                              SizedBox(height: 8.h),
                              HoroscopeText(
                                  text:
                                      'Challenging days: ${horoscope.challengingDays}'),
                              HoroscopeText(
                                  text:
                                      'Standout days: ${horoscope.standoutDays}'),
                            ],
                          ));
                        case LoadingHoroscope _:
                          return Shimmer.fromColors(
                            period: const Duration(milliseconds: 800),
                            baseColor: Colors.transparent,
                            highlightColor: color3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: br10,
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/features/horoscopes/frame.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ),
                          );
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }

  void goToPage(int index) {
    pageController.animateToPage(index,
        duration: Durations.medium1, curve: Curves.decelerate);
  }
}
