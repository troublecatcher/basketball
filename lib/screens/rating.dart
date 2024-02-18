import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_ind.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/api/news.dart';
import 'package:basketball/api/players.dart';
import 'package:basketball/api/teams.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../api/models/news.dart';
import '../api/models/news_details.dart';

late PageController _pageController;
late TextEditingController _searchController;
late List playerList;
late List teamList;

@RoutePage()
class RatingScreen extends ConsumerStatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final teams = ref.watch(teamsProvider);
    final players = ref.watch(playersProvider);
    Map<int, Widget> pages = <int, Widget>{
      0: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 40,
              horizontal: MediaQuery.of(context).size.width / 40),
          child: const Text('Player Stats',
              style: const TextStyle(fontWeight: FontWeight.w600))),
      1: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 40,
              horizontal: MediaQuery.of(context).size.width / 40),
          child: const Text('Team Stats',
              style: const TextStyle(fontWeight: FontWeight.w600))),
    };

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'Rating',
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: CupertinoSlidingSegmentedControl(
                  backgroundColor: const Color.fromRGBO(24, 24, 41, 1),
                  thumbColor: const Color.fromRGBO(237, 107, 78, 1),
                  groupValue: pageIndex,
                  children: pages,
                  onValueChanged: (value) {
                    setState(() {
                      pageIndex = value!;
                      _pageController.animateToPage(value,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease);
                    });
                  }),
            ),
            Expanded(
              flex: 10,
              child: PageView(
                controller: _pageController,
                children: [
                  Builder(builder: (context) {
                    return players.when(
                      data: (playersData) {
                        final playersJson = jsonDecode(playersData);
                        playerList = playersJson['body']
                            .map((player) => Player.fromJson(player))
                            .toList();

                        return ListView.builder(
                            itemCount: playerList.length,
                            itemBuilder: (context, index) {
                              String? playerImageUrl;
                              Map<String, dynamic>? playerStat;
                              return GestureDetector(
                                onTap: () => playerImageUrl == null
                                    ? context.router.push(
                                        PlayerRoute(player: playerList[index]))
                                    : context.router.push(PlayerRoute(
                                        player: Player(
                                          playerList[index].playerID,
                                          playerList[index].team,
                                          playerList[index].longName,
                                          playerList[index].teamID,
                                          imgUrl: playerImageUrl,
                                        ),
                                        stat: PlayerIndStat.fromJson(
                                            playerStat))),
                                child: ListTile(
                                  leading: teams.when(
                                    data: (teamData) {
                                      final teamsJson = jsonDecode(teamData);
                                      teamList = teamsJson['body']
                                          .map((team) => Team.fromJson(team))
                                          .toList();
                                      for (var team in teamList) {
                                        if (team.Roster.containsKey(
                                            playerList[index].playerID)) {
                                          playerImageUrl = team.Roster[
                                                  playerList[index].playerID]
                                              ['espnHeadshot'];
                                          playerStat = team.Roster[
                                                  playerList[index].playerID]
                                              ['stats'];
                                        }
                                      }
                                      if (playerImageUrl == null) {
                                        return Image.asset('assets/logo.png',
                                            width: 80, height: 80);
                                      } else {
                                        return Image.network(
                                          playerImageUrl!,
                                          width: 80,
                                          height: 80,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/logo.png',
                                                width: 80,
                                                height: 80);
                                          },
                                        );
                                      }
                                    },
                                    loading: () =>
                                        const CupertinoActivityIndicator(),
                                    error: (error, stackTrace) =>
                                        Text('Error: $error'),
                                  ),
                                  title: Text(playerList[index].longName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text(playerList[index].team),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white),
                                ),
                              );
                            });
                      },
                      loading: () =>
                          const Center(child: CupertinoActivityIndicator()),
                      error: (error, stackTrace) => Text('Error: $error'),
                    );
                  }),
                  Builder(builder: (context) {
                    return teams.when(
                      data: (teamData) {
                        final teamsJson = jsonDecode(teamData);
                        teamList = teamsJson['body']
                            .map((team) => Team.fromJson(team))
                            .toList();
                        return ListView.builder(
                            itemCount: teamList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => context.router
                                    .push(TeamRoute(team: teamList[index])),
                                child: ListTile(
                                  leading: Image.network(
                                    teamList[index].espnLogo1,
                                    width: 40,
                                    height: 40,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset('assets/logo.png',
                                          width: 40, height: 40);
                                    },
                                  ),
                                  title: Text(
                                      '${teamList[index].teamCity} ${teamList[index].teamName}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text(teamList[index].teamAbv),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white),
                                ),
                              );
                            });
                      },
                      loading: () =>
                          const Center(child: CupertinoActivityIndicator()),
                      error: (error, stackTrace) => Text('Error: $error'),
                    );
                  }),
                ],
              ),
            ),
          ],
        )));
  }
}
