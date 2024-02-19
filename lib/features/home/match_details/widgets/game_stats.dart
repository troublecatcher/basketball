import 'dart:convert';
import 'package:basketball/api/models/box_score.dart';
import 'package:basketball/api/models/team_stat.dart';
import 'package:basketball/api/providers/boxscore_provider.dart';
import 'package:basketball/features/home/match_details/match_details_screen.dart';
import 'package:basketball/features/home/match_details/misc/columns.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameStats extends StatelessWidget {
  const GameStats({
    super.key,
    required this.ref,
    required this.widget,
  });

  final WidgetRef ref;
  final MatchDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // final boxscore = getBoxScore(widget.match.gameID);
      final boxscoreData = ref.watch(boxscoreProvider);
      return boxscoreData.when(
        data: (boxscores) {
          final boxscoresJson = jsonDecode(boxscores);
          BoxScore boxScore = BoxScore.fromJson(boxscoresJson);
          final teamStats = boxScore.teamStats;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: teamStatsColumns(
                  widget.teamHome.teamName, widget.teamAway.teamName),
              rows: [
                ...List.generate(24, (index) {
                  // TeamStat teamStatHome =
                  //     TeamStat.fromJson(teamStats!['CLE']);
                  // TeamStat teamStatAway =
                  //     TeamStat.fromJson(teamStats['SA']);
                  TeamStat teamStatHome =
                      TeamStat.fromJson(teamStats![widget.teamHome.teamAbv]);
                  TeamStat teamStatAway =
                      TeamStat.fromJson(teamStats[widget.teamAway.teamAbv]);
                  final homeMap = teamStatHome.teamStatToMap();
                  final awayMap = teamStatAway.teamStatToMap();
                  bool isHomeGreater = false;
                  bool isAwayGreater = false;
                  if (double.parse(homeMap.values.elementAt(index)) >
                      double.parse(awayMap.values.elementAt(index))) {
                    isHomeGreater = true;
                  }
                  if (double.parse(awayMap.values.elementAt(index)) >
                      double.parse(homeMap.values.elementAt(index))) {
                    isAwayGreater = true;
                  }
                  return DataRow(
                    cells: [
                      DataCell(Text(homeMap.keys.elementAt(index))),
                      DataCell(Row(
                        children: [
                          Text(homeMap.values.elementAt(index)),
                          isHomeGreater
                              ? const Icon(
                                  Icons.arrow_left,
                                  color: Color.fromRGBO(237, 107, 78, 1),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )),
                      DataCell(Row(
                        children: [
                          Text(awayMap.values.elementAt(index)),
                          isAwayGreater
                              ? const Icon(
                                  Icons.arrow_left,
                                  color: Color.fromRGBO(237, 107, 78, 1),
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
        loading: () => const LoadingIndicator(isCentered: true),
        error: (error, stackTrace) => ErrorTextWidget(error: error),
      );
    });
  }
}
