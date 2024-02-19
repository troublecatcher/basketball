import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/features/rating/tables/defensive_stats_table.dart';
import 'package:basketball/features/rating/tables/offensive_stats_table.dart';
import 'package:basketball/features/rating/tables/top_performers_table.dart';
import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../consts.dart';
import '../../../router/router.dart';
import '../../shared/info_widget.dart';
import '../tables/columns.dart';

@RoutePage()
class TeamInfoScreen extends StatelessWidget {
  final Team team;
  const TeamInfoScreen(this.team, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          team.teamName,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Image.network(
                  team.espnLogo1,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const ErrorImageWidget(side: 100),
                ),
                const SizedBox(height: 10),
                CupertinoButton(
                    color: kOrange,
                    child: const Text('Team Roster',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    onPressed: () {
                      context.router.push(RosterInfoRoute(team: team));
                    })
              ],
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoWidget(title: 'City', child: team.teamCity),
                    InfoWidget(title: 'Name', child: team.teamName),
                  ],
                ),
                InfoWidget(title: 'Abbreviation', child: team.teamAbv),
                InfoWidget(title: 'Conference', child: team.conference),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoWidget(title: 'Wins', child: team.wins),
                    InfoWidget(title: 'Loss', child: team.loss),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoWidget(title: 'PPG', child: team.ppg),
                    InfoWidget(title: 'OPPG', child: team.oppg),
                  ],
                ),
                InfoWidget(
                    title: 'Current Streak',
                    child: team.currentStreak['result'] +
                        team.currentStreak['length'].toString()),
              ],
            ),
            const SizedBox(height: 15),
            Text('Top Performers',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            TopPerformersTable(team: team),
            const SizedBox(height: 15),
            Text('Offensive Stats',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: OffensiveStatsTable(
                  statsColumns: teamStatColumns, team: team),
            ),
            const SizedBox(height: 15),
            Text('Defensive Stats',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DefensiveStatsTable(
                  statsColumns: teamStatColumns, team: team),
            ),
          ],
        ),
      )),
    );
  }
}
