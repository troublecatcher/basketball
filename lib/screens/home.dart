import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/matches.dart';
import 'package:basketball/api/players.dart';
import 'package:basketball/api/teams.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../api/models/team.dart';
import '../api/models/match.dart';

late StateProvider<String> dateProvider;

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
    dateProvider = StateProvider<String>((ref) => formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Main',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.parse(ref.watch(dateProvider)),
                firstDate: DateTime(0),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyyMMdd').format(pickedDate);
                ref.read(dateProvider.notifier).state = formattedDate;
              }
            },
            child: Row(
              children: [
                const Icon(Icons.calendar_month_rounded, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                    DateFormat('dd.MM.yyyy')
                        .format(DateTime.parse(ref.watch(dateProvider))),
                    style: TextStyle(color: Colors.white, fontSize: 24.sp)),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          final matchesData = ref.watch(matchesProvider);
          return matchesData.when(
            loading: () => const Center(child: CupertinoActivityIndicator()),
            error: (error, stackTrace) => Text('Error: $error'),
            data: (matches) {
              if (matches.contains('error')) {
                return Center(
                    child: Text('No matches for today',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600)));
              } else {
                final jsonData = jsonDecode(matches);
                List matchList = jsonData['body'].values.toList();
                // matchList = matchList.where((matchData) {
                //   return matchData['gameStatus'] != "Completed";
                // }).toList();
                matchList.sort((a, b) {
                  final matchA = GivenMatch.fromJson(a);
                  final matchB = GivenMatch.fromJson(b);
                  return double.tryParse(matchA.gameTime)!
                      .toInt()
                      .compareTo(double.tryParse(matchB.gameTime)!.toInt());
                });

                return ListView.builder(
                  itemCount: matchList.length,
                  itemBuilder: (context, index) {
                    final matchData = matchList[index];
                    return Column(
                      children: [
                        MatchCard(matchData: matchData),
                      ],
                    );
                  },
                );
              }
            },
          );
        }),
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
    final match = GivenMatch.fromJson(matchData);

    return teamsData.when(
      data: (teams) {
        final teamsJson = jsonDecode(teams);
        List teamList =
            teamsJson['body'].map((team) => Team.fromJson(team)).toList();
        return GestureDetector(
          onTap: () => context.router.push(MatchDetailsRoute(
              match: match,
              teamHome:
                  teamList.firstWhere((team) => team.teamAbv == match.home),
              teamAway:
                  teamList.firstWhere((team) => team.teamAbv == match.away))),
          child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 0,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 12,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(43, 43, 61, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.home)
                                    .espnLogo1,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset('assets/logo.png',
                                      width: 40, height: 40);
                                },
                              ),
                              Image.network(
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.away)
                                    .espnLogo1,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset('assets/logo.png',
                                      width: 40, height: 40);
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Text(
                                    '${teamList.firstWhere((team) => team.teamAbv == match.home).teamName} vs ${teamList.firstWhere((team) => team.teamAbv == match.away).teamName}',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(height: 10),
                              Text('${match.homePts} - ${match.awayPts}',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(34, 34, 50, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                          child: FittedBox(
                              child: Text(
                        match.gameClock,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ))),
                    ),
                  )
                ],
              )),
        );
      },
      loading: () => Shimmer.fromColors(
        baseColor: const Color.fromRGBO(34, 34, 50, 1),
        highlightColor: Colors.grey.shade100,
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            elevation: 0,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 12,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(43, 43, 61, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(34, 34, 50, 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: const Center(child: Text('123')),
                )
              ],
            )),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
