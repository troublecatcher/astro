import 'package:astro/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HoroscopePlaceholder extends StatelessWidget {
  HoroscopePlaceholder({
    super.key,
  });
  final dummyPageController = PageController(
    viewportFraction: 0.7,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: dummyPageController,
      children: List.generate(
        3,
        (index) => Shimmer.fromColors(
          period: const Duration(milliseconds: 800),
          baseColor: Colors.transparent,
          highlightColor: color3,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            decoration: BoxDecoration(
              borderRadius: br10,
              image: const DecorationImage(
                image: AssetImage('assets/features/horoscopes/frame.png'),
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
        ),
      ),
    );
  }
}


// final now = DateTime.now();
//                               final newDateTime = await showDatePicker(
//                                 context: context,
//                                 firstDate: DateTime(2000),
//                                 lastDate: now.subtract(const Duration(days: 2)),
//                               );
//                               if (newDateTime != null) {
//                                 context.read<TimeBloc>().add(
//                                       TimeSetDailyMode(
//                                         dailyMode: HoroscopeDailyMode.other,
//                                         dateTime: newDateTime,
//                                       ),
//                                     );
//                                 context.read<HoroscopeBloc>().add(
//                                       HoroscopeSetDailyMode(
//                                         dateTime: newDateTime,
//                                       ),
//                                     );
//                               }


// title = state.dateTime == null
                            //     ? toBeginningOfSentenceCase(dailyMode.name)
                            //     : DateFormat('dd.MM.yyyy').format(dateTime!);