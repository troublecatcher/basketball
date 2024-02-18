import 'package:auto_route/auto_route.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
const key = '10cb8282bemshac23a2eb66212c3p1d69afjsn7cb94ae7f402';
final headers = {
  'X-RapidAPI-Key': key,
  'X-RapidAPI-Host': 'tank01-fantasy-stats.p.rapidapi.com'
};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // locator<SharedPreferences>().clear();
  if (locator<SharedPreferences>().getBool('isFirstTime') == null) {
    await locator<SharedPreferences>().setBool('isFirstTime', true);
  }
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp.router(
          theme: ThemeData(
              listTileTheme: const ListTileThemeData(
                  titleTextStyle: TextStyle(color: Colors.white)),
              splashColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                  color: const Color.fromRGBO(24, 24, 41, 1),
                  foregroundColor: Colors.white,
                  titleTextStyle: TextStyle(fontSize: 24.sp)),
              primarySwatch: Colors.red,
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Color.fromRGBO(82, 41, 17, 1)),
              scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 41, 1),
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                  fontFamily: 'ssp')),
          routerDelegate: AutoRouterDelegate(
            _appRouter,
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
