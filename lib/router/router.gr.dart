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
    LaunchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LaunchScreen(),
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
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayerScreen(
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
    RosterRoute.name: (routeData) {
      final args = routeData.argsAs<RosterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RosterScreen(args.team),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TeamRoute.name: (routeData) {
      final args = routeData.argsAs<TeamRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeamScreen(
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
/// [LaunchScreen]
class LaunchRoute extends PageRouteInfo<void> {
  const LaunchRoute({List<PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

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
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlayerScreen]
class PlayerRoute extends PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    required Player player,
    Key? key,
    PlayerIndStat? stat,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            player: player,
            key: key,
            stat: stat,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const PageInfo<PlayerRouteArgs> page = PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    required this.player,
    this.key,
    this.stat,
  });

  final Player player;

  final Key? key;

  final PlayerIndStat? stat;

  @override
  String toString() {
    return 'PlayerRouteArgs{player: $player, key: $key, stat: $stat}';
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
/// [RosterScreen]
class RosterRoute extends PageRouteInfo<RosterRouteArgs> {
  RosterRoute({
    required Team team,
    List<PageRouteInfo>? children,
  }) : super(
          RosterRoute.name,
          args: RosterRouteArgs(team: team),
          initialChildren: children,
        );

  static const String name = 'RosterRoute';

  static const PageInfo<RosterRouteArgs> page = PageInfo<RosterRouteArgs>(name);
}

class RosterRouteArgs {
  const RosterRouteArgs({required this.team});

  final Team team;

  @override
  String toString() {
    return 'RosterRouteArgs{team: $team}';
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
/// [TeamScreen]
class TeamRoute extends PageRouteInfo<TeamRouteArgs> {
  TeamRoute({
    required Team team,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TeamRoute.name,
          args: TeamRouteArgs(
            team: team,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TeamRoute';

  static const PageInfo<TeamRouteArgs> page = PageInfo<TeamRouteArgs>(name);
}

class TeamRouteArgs {
  const TeamRouteArgs({
    required this.team,
    this.key,
  });

  final Team team;

  final Key? key;

  @override
  String toString() {
    return 'TeamRouteArgs{team: $team, key: $key}';
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
