import 'package:auto_route/auto_route.dart';
import 'package:basketball/router/router.dart';
import 'package:basketball/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> main() async {
  await init();
  runApp(ProviderScope(child: MainApp()));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // locator<SharedPreferences>().clear();
  if (locator<SharedPreferences>().getBool('isFirstTime') == null) {
    await locator<SharedPreferences>().setBool('isFirstTime', true);
  }
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
          theme: appTheme(context),
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
