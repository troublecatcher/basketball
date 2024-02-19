// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MatchDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MatchDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MatchDetailsScreen(
          key: args.key,
          match: args.match,
          teamHome: args.teamHome,
          teamAway: args.teamAway,
        ),
      );
    },
    NewsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsDetailsScreen(
          key: args.key,
          news: args.news,
          index: args.index,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PlayerInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayerInfoScreen(
          args.player,
          key: args.key,
          stat: args.stat,
        ),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    RatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingScreen(),
      );
    },
    RosterInfoRoute.name: (routeData) {
      final args = routeData.argsAs<RosterInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RosterInfoScreen(args.team),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TeamInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TeamInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeamInfoScreen(
          args.team,
          key: args.key,
        ),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MatchDetailsScreen]
class MatchDetailsRoute extends PageRouteInfo<MatchDetailsRouteArgs> {
  MatchDetailsRoute({
    Key? key,
    required GivenMatch match,
    required Team teamHome,
    required Team teamAway,
    List<PageRouteInfo>? children,
  }) : super(
          MatchDetailsRoute.name,
          args: MatchDetailsRouteArgs(
            key: key,
            match: match,
            teamHome: teamHome,
            teamAway: teamAway,
          ),
          initialChildren: children,
        );

  static const String name = 'MatchDetailsRoute';

  static const PageInfo<MatchDetailsRouteArgs> page =
      PageInfo<MatchDetailsRouteArgs>(name);
}

class MatchDetailsRouteArgs {
  const MatchDetailsRouteArgs({
    this.key,
    required this.match,
    required this.teamHome,
    required this.teamAway,
  });

  final Key? key;

  final GivenMatch match;

  final Team teamHome;

  final Team teamAway;

  @override
  String toString() {
    return 'MatchDetailsRouteArgs{key: $key, match: $match, teamHome: $teamHome, teamAway: $teamAway}';
  }
}

/// generated route for
/// [NewsDetailsScreen]
class NewsDetailsRoute extends PageRouteInfo<NewsDetailsRouteArgs> {
  NewsDetailsRoute({
    Key? key,
    required News news,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailsRoute.name,
          args: NewsDetailsRouteArgs(
            key: key,
            news: news,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailsRoute';

  static const PageInfo<NewsDetailsRouteArgs> page =
      PageInfo<NewsDetailsRouteArgs>(name);
}

class NewsDetailsRouteArgs {
  const NewsDetailsRouteArgs({
    this.key,
    required this.news,
    required this.index,
  });

  final Key? key;

  final News news;

  final int index;

  @override
  String toString() {
    return 'NewsDetailsRouteArgs{key: $key, news: $news, index: $index}';
  }
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlayerInfoScreen]
class PlayerInfoRoute extends PageRouteInfo<PlayerInfoRouteArgs> {
  PlayerInfoRoute({
    required Player player,
    Key? key,
    PlayerStatIndividual? stat,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerInfoRoute.name,
          args: PlayerInfoRouteArgs(
            player: player,
            key: key,
            stat: stat,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerInfoRoute';

  static const PageInfo<PlayerInfoRouteArgs> page =
      PageInfo<PlayerInfoRouteArgs>(name);
}

class PlayerInfoRouteArgs {
  const PlayerInfoRouteArgs({
    required this.player,
    this.key,
    this.stat,
  });

  final Player player;

  final Key? key;

  final PlayerStatIndividual? stat;

  @override
  String toString() {
    return 'PlayerInfoRouteArgs{player: $player, key: $key, stat: $stat}';
  }
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RatingScreen]
class RatingRoute extends PageRouteInfo<void> {
  const RatingRoute({List<PageRouteInfo>? children})
      : super(
          RatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RosterInfoScreen]
class RosterInfoRoute extends PageRouteInfo<RosterInfoRouteArgs> {
  RosterInfoRoute({
    required Team team,
    List<PageRouteInfo>? children,
  }) : super(
          RosterInfoRoute.name,
          args: RosterInfoRouteArgs(team: team),
          initialChildren: children,
        );

  static const String name = 'RosterInfoRoute';

  static const PageInfo<RosterInfoRouteArgs> page =
      PageInfo<RosterInfoRouteArgs>(name);
}

class RosterInfoRouteArgs {
  const RosterInfoRouteArgs({required this.team});

  final Team team;

  @override
  String toString() {
    return 'RosterInfoRouteArgs{team: $team}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeamInfoScreen]
class TeamInfoRoute extends PageRouteInfo<TeamInfoRouteArgs> {
  TeamInfoRoute({
    required Team team,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TeamInfoRoute.name,
          args: TeamInfoRouteArgs(
            team: team,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TeamInfoRoute';

  static const PageInfo<TeamInfoRouteArgs> page =
      PageInfo<TeamInfoRouteArgs>(name);
}

class TeamInfoRouteArgs {
  const TeamInfoRouteArgs({
    required this.team,
    this.key,
  });

  final Team team;

  final Key? key;

  @override
  String toString() {
    return 'TeamInfoRouteArgs{team: $team, key: $key}';
  }
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
