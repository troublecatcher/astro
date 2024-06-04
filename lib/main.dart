import 'package:astro/app/config/init_di.dart';
import 'package:astro/app/config/init_hive.dart';
import 'package:astro/app/theme.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/daily_horoscope/daily_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/monthly_horoscope/monthly_horoscope.dart';
import 'package:astro/features/primary/horoscope/domain/horoscope/models/weekly_horoscope/weekly_horoscope.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_cubit.dart';
import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/features/secondary/profile/shared/controller/profile_list_cubit.dart';
import 'package:astro/app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

late Box<Profile> profileBox;
late Box<DailyHoroscope> dailyHoroscopeBox;
late Box<WeeklyHoroscope> weeklyHoroscopeBox;
late Box<MonthlyHoroscope> monthlyHoroscopeBox;
final di = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await initHive();

  setPathUrlStrategy();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentProfileCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProfileListCubit(
            context.read<CurrentProfileCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => FeatureSelectionCubit(),
          child: Container(),
        )
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
