import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../api/models/news.dart';
import '../screens/etc/notification.dart';
import '../screens/etc/privacy_policy.dart';
import '../screens/etc/terms_of_use.dart';
import '../screens/home.dart';
import '../screens/launch.dart';
import '../screens/news.dart';
import '../screens/news_details.dart';
import '../screens/notes.dart';
import '../screens/settings.dart';
import 'tabs_router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: NotesRoute.page),
          AutoRoute(page: NewsRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ]),
        AutoRoute(page: LaunchRoute.page, initial: true),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: NewsDetailsRoute.page),
      ];
}
