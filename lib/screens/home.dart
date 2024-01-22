import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/matches.dart';
import 'package:basketball/api/teams.dart';
import 'package:basketball/screens/image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:convert';
import 'package:intl/intl.dart';

import '../api/models/team.dart';
import '../api/models/match.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesData = ref.watch(matchesProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(82, 41, 17, 1),
        centerTitle: true,
        title: Text(
          'Matches',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: matchesData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (matches) {
          final jsonData = jsonDecode(matches);
          List matchList = jsonData['body'].values.toList();
          matchList = matchList.where((matchData) {
            return matchData['gameStatus'] != "Completed";
          }).toList();
          matchList.sort((a, b) {
            final matchA = Match.fromJson(a);
            final matchB = Match.fromJson(b);
            return double.tryParse(matchA.gameTime)!
                .toInt()
                .compareTo(double.tryParse(matchB.gameTime)!.toInt());
          });

          return ListView.builder(
            itemCount: matchList.length,
            itemBuilder: (context, index) {
              final matchData = matchList[index];
              // matchList[0]['gameStatus'] = "Live - In Progress";
              // matchList[0]['gameClock'] = "4th - 38:22";
              // matchList[0]['homePts'] = "128";
              // matchList[0]['awayPts'] = "122";
              final firstNonCurrentMatchIndex = matchList.indexOf(
                  matchList.firstWhere(
                      (match) => match['gameStatus'] != "Live - In Progress"));
              if (index == firstNonCurrentMatchIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        "Next Matches",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    MatchCard(matchData: matchData),
                  ],
                );
              } else {
                return Column(
                  children: [
                    matchData['gameStatus'] == "Live - In Progress"
                        ? CurrentMatchCard(matchData: matchData)
                        : MatchCard(matchData: matchData),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}

class CurrentMatchCard extends ConsumerWidget {
  final Map<String, dynamic> matchData;

  const CurrentMatchCard({Key? key, required this.matchData}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamsData = ref.watch(teamsProvider);
    final match = Match.fromJson(matchData);

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      height: 173,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF4752C),
            Color(0xFF522911),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 20),
                  child: teamsData.when(
                    data: (teams) {
                      final teamsJson = jsonDecode(teams);
                      List teamList = teamsJson['body']
                          .map((team) => Team.fromJson(team))
                          .toList();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 20),
                          ImageWidget(
                            teamList: teamList,
                            match: match,
                            ha: 'h',
                          ),
                          Text(
                            teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.home)
                                    .teamCity +
                                ' ' +
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.home)
                                    .teamName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Text('Error: $error'),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                        DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                double.parse(match.gameTime).toInt() * 1000)),
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 10),
                    Text('${match.homePts}-${match.awayPts}',
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, right: 20),
                  child: teamsData.when(
                    data: (teams) {
                      final teamsJson = jsonDecode(teams);
                      List teamList = teamsJson['body']
                          .map((team) => Team.fromJson(team))
                          .toList();
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          ImageWidget(
                            teamList: teamList,
                            match: match,
                            ha: 'a',
                          ),
                          Text(
                              teamList
                                      .firstWhere(
                                          (team) => team.teamAbv == match.away)
                                      .teamCity +
                                  ' ' +
                                  teamList
                                      .firstWhere(
                                          (team) => team.teamAbv == match.away)
                                      .teamName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Text('Error: $error'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromRGBO(172, 87, 37, 0.5)),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 7, right: 14, bottom: 7, left: 14),
              child: Text(
                '${match.gameClock.split(' - ')[0]} ${match.gameClock.split(' - ')[1]}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MatchCard extends ConsumerWidget {
  final Map<String, dynamic> matchData;

  const MatchCard({Key? key, required this.matchData}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamsData = ref.watch(teamsProvider);
    final match = Match.fromJson(matchData);
    DateTime matchDate = DateTime.parse(match.gameID.substring(0, 8));
    String formattedMatchDate =
        "${matchDate.day.toString().padLeft(2, '0')}/${matchDate.month.toString().padLeft(2, '0')}/${matchDate.year.toString()}";

    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 0,
      child: Container(
        height: 124,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(82, 41, 17, 0.1),
              offset: Offset(2, 4),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20),
                child: teamsData.when(
                  data: (teams) {
                    final teamsJson = jsonDecode(teams);
                    List teamList = teamsJson['body']
                        .map((team) => Team.fromJson(team))
                        .toList();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageWidget(
                          teamList: teamList,
                          match: match,
                          ha: 'h',
                        ),
                        Text(
                            teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.home)
                                    .teamCity +
                                ' ' +
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.home)
                                    .teamName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(formattedMatchDate,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Text(
                      DateFormat.Hm().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              double.parse(match.gameTime).toInt() * 1000)),
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Text('VS', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 20),
                child: teamsData.when(
                  data: (teams) {
                    final teamsJson = jsonDecode(teams);
                    List teamList = teamsJson['body']
                        .map((team) => Team.fromJson(team))
                        .toList();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageWidget(
                          teamList: teamList,
                          match: match,
                          ha: 'a',
                        ),
                        Text(
                            teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.away)
                                    .teamCity +
                                ' ' +
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.away)
                                    .teamName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
