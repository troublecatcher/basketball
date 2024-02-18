import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/models/match.dart';
import '../api/models/news.dart';
import '../api/models/news_details.dart';
import '../api/models/player.dart';
import '../api/models/player_stat_ind.dart';
import '../api/models/team.dart';
import '../main.dart';
import '../screens/etc/notification.dart';
import '../screens/etc/privacy_policy.dart';
import '../screens/etc/terms_of_use.dart';
import '../screens/home.dart';
import '../screens/launch.dart';
import '../screens/match_details.dart';
import '../screens/news.dart';
import '../screens/news_details.dart';
import '../screens/player_screen.dart';
import '../screens/rating.dart';
import '../screens/roster_screen.dart';
import '../screens/settings.dart';
import '../screens/team_screen.dart';
import 'tabs_router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MainRoute.page,
            initial: !locator<SharedPreferences>().getBool('isFirstTime')!,
            children: [
              AutoRoute(page: HomeRoute.page, initial: true),
              AutoRoute(page: NewsRoute.page),
              AutoRoute(page: RatingRoute.page),
              AutoRoute(page: SettingsRoute.page),
            ]),
        AutoRoute(
            page: LaunchRoute.page,
            initial: locator<SharedPreferences>().getBool('isFirstTime')!),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: MatchDetailsRoute.page),
        AutoRoute(page: PlayerRoute.page),
        AutoRoute(page: TeamRoute.page),
        AutoRoute(page: RosterRoute.page),
        AutoRoute(page: NewsDetailsRoute.page),
      ];
}
