import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/models/given_match.dart';
import '../api/models/news.dart';
import '../api/models/player.dart';
import '../api/models/player_stat_individual.dart';
import '../api/models/team.dart';
import '../features/news/screens/news_details_screen.dart';
import '../features/news/screens/news_screen.dart';
import '../features/rating/player/player_info_screen.dart';
import '../features/rating/rating_screen.dart';
import '../features/rating/team/roster_info_screen.dart';
import '../features/rating/team/team_info_screen.dart';
import '../features/settings/screens/privacy_policy_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import '../features/settings/screens/terms_of_use_screen.dart';
import '../main.dart';
import '../features/home/home_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/home/match_details/match_details_screen.dart';
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
            page: OnboardingRoute.page,
            initial: locator<SharedPreferences>().getBool('isFirstTime')!),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: MatchDetailsRoute.page),
        AutoRoute(page: PlayerInfoRoute.page),
        AutoRoute(page: TeamInfoRoute.page),
        AutoRoute(page: RosterInfoRoute.page),
        AutoRoute(page: NewsDetailsRoute.page),
      ];
}
