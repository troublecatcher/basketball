import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/home/widgets/loading_match_card.dart';
import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/models/given_match.dart';
import '../../../api/models/team.dart';
import '../../../api/providers/teams_provider.dart';
import '../../../consts.dart';
import '../../../router/router.dart';

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
                    height: MediaQuery.of(context).size.height / 10,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: kGrey43,
                        borderRadius: BorderRadius.only(
                            topLeft: kBorderRadius, bottomLeft: kBorderRadius)),
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
                                errorBuilder: (context, error, stackTrace) =>
                                    const ErrorImageWidget(side: 40),
                              ),
                              Image.network(
                                teamList
                                    .firstWhere(
                                        (team) => team.teamAbv == match.away)
                                    .espnLogo1,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) =>
                                    const ErrorImageWidget(side: 40),
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
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        color: kGrey34,
                        borderRadius: BorderRadius.only(
                            topRight: kBorderRadius,
                            bottomRight: kBorderRadius)),
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
        baseColor: kGrey34,
        highlightColor: Colors.grey.shade100,
        child: const LoadingMatchCard(),
      ),
      error: (error, stackTrace) => ErrorTextWidget(error: error),
    );
  }
}
