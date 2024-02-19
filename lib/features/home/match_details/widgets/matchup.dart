import 'dart:convert';
import 'package:basketball/api/models/box_score.dart';
import 'package:basketball/api/models/line_score.dart';
import 'package:basketball/api/providers/boxscore_provider.dart';
import 'package:basketball/features/home/match_details/match_details_screen.dart';
import 'package:basketball/features/home/match_details/misc/columns.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/info_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Matchup extends StatelessWidget {
  const Matchup({
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
      return SingleChildScrollView(
        child: Center(
          child: boxscoreData.when(
            data: (boxscores) {
              final boxscoresJson = jsonDecode(boxscores);
              BoxScore boxScore = BoxScore.fromJson(boxscoresJson);
              final lineScores = boxScore.lineScore;
              LineScore lineScoreHome =
                  LineScore.fromJson(lineScores![widget.teamHome.teamAbv]);
              LineScore lineScoreAway =
                  LineScore.fromJson(lineScores[widget.teamAway.teamAbv]);
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: lineScoreColumns,
                      rows: [
                        ...List.generate(2, (index) {
                          String teamAbv = lineScores.keys.elementAt(index);
                          String teamName = '';
                          if (teamAbv == widget.teamHome.teamAbv) {
                            teamName = widget.teamAway.teamName;
                            return DataRow(
                              cells: [
                                DataCell(Text(teamName)),
                                DataCell(Text(lineScoreAway.q1)),
                                DataCell(Text(lineScoreAway.q2)),
                                DataCell(Text(lineScoreAway.q3)),
                                DataCell(Text(lineScoreAway.q4)),
                                DataCell(Text(lineScoreAway.totalPts)),
                              ],
                            );
                          } else {
                            teamName = widget.teamHome.teamName;
                            return DataRow(
                              cells: [
                                DataCell(Text(teamName)),
                                DataCell(Text(lineScoreHome.q1)),
                                DataCell(Text(lineScoreHome.q2)),
                                DataCell(Text(lineScoreHome.q3)),
                                DataCell(Text(lineScoreHome.q4)),
                                DataCell(Text(lineScoreHome.totalPts)),
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
                            double.parse(widget.match.gameTime).toInt() *
                                1000)),
                  ),
                  InfoWidget(
                    title: 'Time',
                    child: DateFormat('HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            double.parse(widget.match.gameTime).toInt() *
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
            loading: () => const LoadingIndicator(isCentered: true),
            error: (error, stackTrace) => ErrorTextWidget(error: error),
          ),
        ),
      );
    });
  }
}
