import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/boxscores.dart';
import 'package:basketball/api/models/boxscore.dart';
import 'package:basketball/api/models/line_score.dart';
import 'package:basketball/api/models/player_stat.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/api/models/match.dart';
import 'package:basketball/api/models/team_stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

late PageController _pageController;
late PageController _teamController;
late StateProvider<String> gameIDProvider;

@RoutePage()
class MatchDetailsScreen extends ConsumerStatefulWidget {
  final GivenMatch match;
  final Team teamHome;
  final Team teamAway;
  const MatchDetailsScreen(
      {Key? key,
      required this.match,
      required this.teamHome,
      required this.teamAway})
      : super(key: key);

  @override
  MatchDetailsScreenState createState() => MatchDetailsScreenState();
}

class MatchDetailsScreenState extends ConsumerState<MatchDetailsScreen> {
  int pageIndex = 0;
  int teamIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _teamController = PageController(initialPage: 0);
    gameIDProvider = StateProvider<String>((ref) => widget.match.gameID);
  }

  @override
  Widget build(BuildContext context) {
    const playerStatsColumns = [
      DataColumn(label: Text('PLAYER')),
      DataColumn(label: Text('MIN')),
      DataColumn(label: Text('PTS')),
      DataColumn(label: Text('REB')),
      DataColumn(label: Text('AST')),
      DataColumn(label: Text('BLK')),
      DataColumn(label: Text('STL')),
      DataColumn(label: Text('TOV')),
      DataColumn(label: Text('+/-')),
      DataColumn(label: Text('PF')),
      DataColumn(label: Text('FGP')),
      DataColumn(label: Text('FGA')),
      DataColumn(label: Text('FGM')),
    ];
    const lineScoreColumns = [
      DataColumn(label: Text('TEAM')),
      DataColumn(label: Text('Q1')),
      DataColumn(label: Text('Q2')),
      DataColumn(label: Text('Q3')),
      DataColumn(label: Text('Q4')),
      DataColumn(label: Text('TOTAL')),
    ];
    final teamStatsColumns = [
      const DataColumn(
        label: Text('STATS'),
      ),
      DataColumn(
          label: Text(
        widget.teamHome.teamName,
        maxLines: 1,
      )),
      DataColumn(
          label: Text(
        widget.teamAway.teamName,
        maxLines: 1,
      )),
    ];
    Map<int, Widget> pages = <int, Widget>{
      0: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 30,
              horizontal: MediaQuery.of(context).size.width / 40),
          child: const Text('Matchup',
              style: const TextStyle(fontWeight: FontWeight.w600))),
      1: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 30,
              horizontal: MediaQuery.of(context).size.width / 40),
          child: const Text('Game Stats',
              style: const TextStyle(fontWeight: FontWeight.w600))),
      2: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 30,
              horizontal: MediaQuery.of(context).size.width / 40),
          child: const Text('Player Stats',
              style: const TextStyle(fontWeight: FontWeight.w600))),
    };
    Map<int, Widget> teams = <int, Widget>{
      0: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 40),
          child: Text(widget.teamHome.teamName)),
      1: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 40),
          child: Text(widget.teamAway.teamName)),
    };

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          widget.teamHome.espnLogo1,
                          width: 60,
                          height: 60,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/logo.png',
                                width: 60, height: 60);
                          },
                        ),
                        Text(widget.teamHome.teamCity,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Text(widget.teamHome.teamName,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            '${widget.match.homePts} - ${widget.match.awayPts}',
                            style: TextStyle(
                                fontSize: 30.sp, fontWeight: FontWeight.w600)),
                        Text(widget.match.gameStatus,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Text(widget.match.gameClock,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          widget.teamAway.espnLogo1,
                          width: 60,
                          height: 60,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/logo.png',
                                width: 60, height: 60);
                          },
                        ),
                        Text(widget.teamAway.teamCity,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Text(widget.teamAway.teamName,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.match.gameStatus == 'Not Started Yet'
                ? const SizedBox.shrink()
                : Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoSlidingSegmentedControl(
                            backgroundColor:
                                const Color.fromRGBO(24, 24, 41, 1),
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
                      ],
                    ),
                  ),
            Expanded(
              flex: 8,
              child: widget.match.gameStatus == 'Not Started Yet'
                  ? const Center(child: Text('The game has not started yet'))
                  : PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Builder(builder: (context) {
                          // final boxscore = getBoxScore(widget.match.gameID);
                          final boxscoreData = ref.watch(boxscoreProvider);
                          return SingleChildScrollView(
                            child: Center(
                              child: boxscoreData.when(
                                data: (boxscores) {
                                  final boxscoresJson = jsonDecode(boxscores);
                                  BoxScore boxScore =
                                      BoxScore.fromJson(boxscoresJson);
                                  final lineScores = boxScore.lineScore;
                                  LineScore lineScoreHome = LineScore.fromJson(
                                      lineScores![widget.teamHome.teamAbv]);
                                  LineScore lineScoreAway = LineScore.fromJson(
                                      lineScores[widget.teamAway.teamAbv]);
                                  return Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: DataTable(
                                          columns: lineScoreColumns,
                                          rows: [
                                            ...List.generate(2, (index) {
                                              String teamAbv = lineScores.keys
                                                  .elementAt(index);
                                              String teamName = '';
                                              if (teamAbv ==
                                                  widget.teamHome.teamAbv) {
                                                teamName =
                                                    widget.teamAway.teamName;
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Text(teamName)),
                                                    DataCell(
                                                        Text(lineScoreAway.q1)),
                                                    DataCell(
                                                        Text(lineScoreAway.q2)),
                                                    DataCell(
                                                        Text(lineScoreAway.q3)),
                                                    DataCell(
                                                        Text(lineScoreAway.q4)),
                                                    DataCell(Text(lineScoreAway
                                                        .totalPts)),
                                                  ],
                                                );
                                              } else {
                                                teamName =
                                                    widget.teamHome.teamName;
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Text(teamName)),
                                                    DataCell(
                                                        Text(lineScoreHome.q1)),
                                                    DataCell(
                                                        Text(lineScoreHome.q2)),
                                                    DataCell(
                                                        Text(lineScoreHome.q3)),
                                                    DataCell(
                                                        Text(lineScoreHome.q4)),
                                                    DataCell(Text(lineScoreHome
                                                        .totalPts)),
                                                  ],
                                                );
                                              }
                                            })
                                          ],
                                        ),
                                      ),
                                      InfoWidget(
                                        title: 'Date',
                                        child: DateFormat('dd.MM.yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                double.parse(widget
                                                            .match.gameTime)
                                                        .toInt() *
                                                    1000)),
                                      ),
                                      InfoWidget(
                                        title: 'Time',
                                        child: DateFormat('HH:mm').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                double.parse(widget
                                                            .match.gameTime)
                                                        .toInt() *
                                                    1000)),
                                      ),
                                      InfoWidget(
                                        title: 'Location',
                                        child: boxScore.gameLocation!,
                                      ),
                                      InfoWidget(
                                        title: 'Arena',
                                        child: boxScore.arena!,
                                      ),
                                      InfoWidget(
                                        title: 'Capacity',
                                        child: boxScore.arenaCapacity!,
                                      ),
                                      Wrap(children: [
                                        InfoWidget(
                                          title: 'Referees',
                                          child: boxScore.referees ?? '',
                                        ),
                                      ]),
                                    ],
                                  );
                                },
                                loading: () => const Center(
                                    child: CupertinoActivityIndicator()),
                                error: (error, stackTrace) =>
                                    Text('Error: $error'),
                              ),
                            ),
                          );
                        }),
                        Builder(builder: (context) {
                          // final boxscore = getBoxScore(widget.match.gameID);
                          final boxscoreData = ref.watch(boxscoreProvider);
                          return boxscoreData.when(
                            data: (boxscores) {
                              final boxscoresJson = jsonDecode(boxscores);
                              BoxScore boxScore =
                                  BoxScore.fromJson(boxscoresJson);
                              final teamStats = boxScore.teamStats;
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  columns: teamStatsColumns,
                                  rows: [
                                    ...List.generate(24, (index) {
                                      // TeamStat teamStatHome =
                                      //     TeamStat.fromJson(teamStats!['CLE']);
                                      // TeamStat teamStatAway =
                                      //     TeamStat.fromJson(teamStats['SA']);
                                      TeamStat teamStatHome = TeamStat.fromJson(
                                          teamStats![widget.teamHome.teamAbv]);
                                      TeamStat teamStatAway = TeamStat.fromJson(
                                          teamStats[widget.teamAway.teamAbv]);
                                      final homeMap =
                                          teamStatHome.teamStatToMap();
                                      final awayMap =
                                          teamStatAway.teamStatToMap();
                                      bool isHomeGreater = false;
                                      bool isAwayGreater = false;
                                      if (double.parse(
                                              homeMap.values.elementAt(index)) >
                                          double.parse(awayMap.values
                                              .elementAt(index))) {
                                        isHomeGreater = true;
                                      }
                                      if (double.parse(
                                              awayMap.values.elementAt(index)) >
                                          double.parse(homeMap.values
                                              .elementAt(index))) {
                                        isAwayGreater = true;
                                      }
                                      return DataRow(
                                        cells: [
                                          DataCell(Text(
                                              homeMap.keys.elementAt(index))),
                                          DataCell(Row(
                                            children: [
                                              Text(homeMap.values
                                                  .elementAt(index)),
                                              isHomeGreater
                                                  ? const Icon(
                                                      Icons.arrow_left,
                                                      color: Color.fromRGBO(
                                                          237, 107, 78, 1),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          )),
                                          DataCell(Row(
                                            children: [
                                              Text(awayMap.values
                                                  .elementAt(index)),
                                              isAwayGreater
                                                  ? const Icon(
                                                      Icons.arrow_left,
                                                      color: Color.fromRGBO(
                                                          237, 107, 78, 1),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          )),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              );
                            },
                            loading: () => const Center(
                                child: CupertinoActivityIndicator()),
                            error: (error, stackTrace) => Text('Error: $error'),
                          );
                        }),
                        Builder(builder: (context) {
                          // final boxscore = getBoxScore(widget.match.gameID);
                          final boxscoreData = ref.watch(boxscoreProvider);
                          return boxscoreData.when(
                            data: (boxscores) {
                              final boxscoresJson = jsonDecode(boxscores);
                              BoxScore boxScore =
                                  BoxScore.fromJson(boxscoresJson);
                              final players = boxScore.playerStats;
                              final playersHome = Map.from(players!);
                              final playersAway = Map.from(players);
                              playersHome.removeWhere((key, value) =>
                                  value['teamAbv'] != widget.teamHome.teamAbv);
                              playersAway.removeWhere((key, value) =>
                                  value['teamAbv'] != widget.teamAway.teamAbv);
                              return Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoSlidingSegmentedControl(
                                        backgroundColor:
                                            const Color.fromRGBO(24, 24, 41, 1),
                                        thumbColor: const Color.fromRGBO(
                                            237, 107, 78, 1),
                                        groupValue: teamIndex,
                                        children: teams,
                                        onValueChanged: (value) {
                                          setState(() {
                                            teamIndex = value!;
                                            _teamController.animateToPage(value,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.ease);
                                          });
                                        }),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: PageView(
                                      controller: _teamController,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: DataTable(
                                              columns: playerStatsColumns,
                                              rows: [
                                                ...List.generate(
                                                    playersHome.length,
                                                    (index) {
                                                  PlayerStat playerStat =
                                                      PlayerStat.fromJson(
                                                          playersHome.values
                                                              .elementAt(
                                                                  index));
                                                  return DataRow(cells: [
                                                    DataCell(Text(
                                                        playerStat.longName)),
                                                    DataCell(
                                                        Text(playerStat.mins)),
                                                    DataCell(
                                                        Text(playerStat.pts)),
                                                    DataCell(
                                                        Text(playerStat.reb)),
                                                    DataCell(
                                                        Text(playerStat.ast)),
                                                    DataCell(
                                                        Text(playerStat.blk)),
                                                    DataCell(
                                                        Text(playerStat.stl)),
                                                    DataCell(
                                                        Text(playerStat.TOV)),
                                                    DataCell(Text(
                                                        playerStat.plusMinus)),
                                                    DataCell(
                                                        Text(playerStat.PF)),
                                                    DataCell(Text(
                                                        playerStat.tptfgp)),
                                                    DataCell(Text(
                                                        playerStat.tptfga)),
                                                    DataCell(Text(
                                                        playerStat.tptfgm)),
                                                  ]);
                                                })
                                              ],
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: DataTable(
                                              columns: playerStatsColumns,
                                              rows: [
                                                ...List.generate(
                                                    playersAway.length,
                                                    (index) {
                                                  PlayerStat playerStat =
                                                      PlayerStat.fromJson(
                                                          playersAway.values
                                                              .elementAt(
                                                                  index));
                                                  return DataRow(cells: [
                                                    DataCell(Text(
                                                        playerStat.longName)),
                                                    DataCell(
                                                        Text(playerStat.mins)),
                                                    DataCell(
                                                        Text(playerStat.pts)),
                                                    DataCell(
                                                        Text(playerStat.reb)),
                                                    DataCell(
                                                        Text(playerStat.ast)),
                                                    DataCell(
                                                        Text(playerStat.blk)),
                                                    DataCell(
                                                        Text(playerStat.stl)),
                                                    DataCell(
                                                        Text(playerStat.TOV)),
                                                    DataCell(Text(
                                                        playerStat.plusMinus)),
                                                    DataCell(
                                                        Text(playerStat.PF)),
                                                    DataCell(Text(
                                                        playerStat.tptfgp)),
                                                    DataCell(Text(
                                                        playerStat.tptfga)),
                                                    DataCell(Text(
                                                        playerStat.tptfgm)),
                                                  ]);
                                                })
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            loading: () => const Center(
                                child: CupertinoActivityIndicator()),
                            error: (error, stackTrace) => Text('Error: $error'),
                          );
                        }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String child;

  const InfoWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color.fromRGBO(43, 43, 61, 1)),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(child),
          ),
        ],
      ),
    );
  }
}
