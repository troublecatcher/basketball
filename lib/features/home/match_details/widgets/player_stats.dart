import 'dart:convert';
import 'package:basketball/api/models/box_score.dart';
import 'package:basketball/api/models/player_stat.dart';
import 'package:basketball/api/providers/boxscore_provider.dart';
import 'package:basketball/consts.dart';
import 'package:basketball/features/home/match_details/match_details_screen.dart';
import 'package:basketball/features/home/match_details/misc/columns.dart';
import 'package:basketball/features/home/match_details/misc/segmented_items.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PlayerStats extends StatelessWidget {
  final WidgetRef ref;
  final MatchDetailsScreen widget;
  late PageController teamController;

  PlayerStats({super.key, required this.ref, required this.widget});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: matchDetailsController,
        builder: (_) {
          teamController =
              PageController(initialPage: matchDetailsController.teamIndex);
          // final boxscore = getBoxScore(widget.match.gameID);
          final boxscoreData = ref.watch(boxscoreProvider);
          return boxscoreData.when(
            data: (boxscores) {
              final boxscoresJson = jsonDecode(boxscores);
              BoxScore boxScore = BoxScore.fromJson(boxscoresJson);
              final players = boxScore.playerStats;
              final playersHome = Map.from(players!);
              final playersAway = Map.from(players);
              playersHome.removeWhere(
                  (key, value) => value['teamAbv'] != widget.teamHome.teamAbv);
              playersAway.removeWhere(
                  (key, value) => value['teamAbv'] != widget.teamAway.teamAbv);
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: CupertinoSlidingSegmentedControl(
                        backgroundColor: kGrey24,
                        thumbColor: const Color.fromRGBO(237, 107, 78, 1),
                        groupValue: matchDetailsController.teamIndex,
                        children: teams(context, widget.teamHome.teamName,
                            widget.teamAway.teamName),
                        onValueChanged: (value) {
                          matchDetailsController.updateTeamIndex(value!);
                          teamController.animateToPage(value,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        }),
                  ),
                  Expanded(
                    flex: 10,
                    child: PageView(
                      controller: teamController,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: playerStatsColumns,
                              rows: [
                                ...List.generate(playersHome.length, (index) {
                                  PlayerStat playerStat = PlayerStat.fromJson(
                                      playersHome.values.elementAt(index));
                                  return DataRow(cells: [
                                    DataCell(Text(playerStat.longName)),
                                    DataCell(Text(playerStat.mins)),
                                    DataCell(Text(playerStat.pts)),
                                    DataCell(Text(playerStat.reb)),
                                    DataCell(Text(playerStat.ast)),
                                    DataCell(Text(playerStat.blk)),
                                    DataCell(Text(playerStat.stl)),
                                    DataCell(Text(playerStat.tov)),
                                    DataCell(Text(playerStat.plusMinus)),
                                    DataCell(Text(playerStat.pf)),
                                    DataCell(Text(playerStat.tptfgp)),
                                    DataCell(Text(playerStat.tptfga)),
                                    DataCell(Text(playerStat.tptfgm)),
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
                                ...List.generate(playersAway.length, (index) {
                                  PlayerStat playerStat = PlayerStat.fromJson(
                                      playersAway.values.elementAt(index));
                                  return DataRow(cells: [
                                    DataCell(Text(playerStat.longName)),
                                    DataCell(Text(playerStat.mins)),
                                    DataCell(Text(playerStat.pts)),
                                    DataCell(Text(playerStat.reb)),
                                    DataCell(Text(playerStat.ast)),
                                    DataCell(Text(playerStat.blk)),
                                    DataCell(Text(playerStat.stl)),
                                    DataCell(Text(playerStat.tov)),
                                    DataCell(Text(playerStat.plusMinus)),
                                    DataCell(Text(playerStat.pf)),
                                    DataCell(Text(playerStat.tptfgp)),
                                    DataCell(Text(playerStat.tptfga)),
                                    DataCell(Text(playerStat.tptfgm)),
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
            loading: () => const LoadingIndicator(isCentered: true),
            error: (error, stackTrace) => ErrorTextWidget(error: error),
          );
        });
  }
}
