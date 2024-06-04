import 'package:astro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
  await di<SharedPreferences>().setBool('isFirstTime', isFirstTime ?? true);

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // final remoteConfig = FirebaseRemoteConfig.instance;
  // await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(seconds: 25),
  //   minimumFetchInterval: const Duration(seconds: 25),
  // ));
  // await remoteConfig.fetchAndActivate();
  // final remoteConfigService = RemoteConfig(remoteConfig);
  // di.registerSingleton<RemoteConfig>(remoteConfigService);
}
