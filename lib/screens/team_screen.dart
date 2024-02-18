import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/router/router.dart';
import 'package:basketball/screens/match_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TeamScreen extends StatelessWidget {
  final Team team;
  const TeamScreen(this.team, {super.key});

  @override
  Widget build(BuildContext context) {
    const topPerformersColumns = [
      DataColumn(label: Text('KPI')),
      DataColumn(label: Text('Player')),
      DataColumn(label: Text('Value')),
    ];
    const statsColumns = [
      DataColumn(label: Text('Position')),
      DataColumn(label: Text('PTS')),
      DataColumn(label: Text('BLK')),
      DataColumn(label: Text('AST')),
      DataColumn(label: Text('STL')),
      DataColumn(label: Text('REB')),
      DataColumn(label: Text('TOV')),
      DataColumn(label: Text('FTA')),
      DataColumn(label: Text('FTM')),
      DataColumn(label: Text('FGA')),
      DataColumn(label: Text('FGM')),
      DataColumn(label: Text('TPTFGA')),
      DataColumn(label: Text('TPTFGM')),
    ];
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
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/logo.png',
                        width: 100, height: 100);
                  },
                ),
                CupertinoButton(
                    color: const Color.fromRGBO(237, 107, 78, 1),
                    child: const Text('Team Roster',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    onPressed: () {
                      context.router.push(RosterRoute(team: team));
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
            DataTable(columns: topPerformersColumns, rows: [
              DataRow(cells: [
                const DataCell(Text('PTS')),
                DataCell(Text(team.topPerformers['pts']['playerID'][0])),
                DataCell(Text(team.topPerformers['pts']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('BLK')),
                DataCell(Text(team.topPerformers['blk']['playerID'][0])),
                DataCell(Text(team.topPerformers['blk']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('AST')),
                DataCell(Text(team.topPerformers['ast']['playerID'][0])),
                DataCell(Text(team.topPerformers['ast']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('STL')),
                DataCell(Text(team.topPerformers['stl']['playerID'][0])),
                DataCell(Text(team.topPerformers['stl']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('REB')),
                DataCell(Text(team.topPerformers['reb']['playerID'][0])),
                DataCell(Text(team.topPerformers['reb']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('TOV')),
                DataCell(Text(team.topPerformers['TOV']['playerID'][0])),
                DataCell(Text(team.topPerformers['TOV']['total'])),
              ]),
              DataRow(cells: [
                const DataCell(Text('TPTFGM')),
                DataCell(Text(team.topPerformers['tptfgm']['playerID'][0])),
                DataCell(Text(team.topPerformers['tptfgm']['total'])),
              ]),
            ]),
            const SizedBox(height: 15),
            Text('Offensive Stats',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                  OffensiveStatsTable(statsColumns: statsColumns, team: team),
            ),
            const SizedBox(height: 15),
            Text('Defensive Stats',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                  DefensiveStatsTable(statsColumns: statsColumns, team: team),
            ),
          ],
        ),
      )),
    );
  }
}

class OffensiveStatsTable extends StatelessWidget {
  const OffensiveStatsTable({
    super.key,
    required this.statsColumns,
    required this.team,
  });

  final List<DataColumn> statsColumns;
  final Team team;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: statsColumns, rows: [
      DataRow(cells: [
        const DataCell(Text('C')),
        DataCell(Text(team.offensiveStats['pts']['C'])),
        DataCell(Text(team.offensiveStats['blk']['C'])),
        DataCell(Text(team.offensiveStats['ast']['C'])),
        DataCell(Text(team.offensiveStats['stl']['C'])),
        DataCell(Text(team.offensiveStats['reb']['C'])),
        DataCell(Text(team.offensiveStats['TOV']['C'])),
        DataCell(Text(team.offensiveStats['fta']['C'])),
        DataCell(Text(team.offensiveStats['ftm']['C'])),
        DataCell(Text(team.offensiveStats['fga']['C'])),
        DataCell(Text(team.offensiveStats['fgm']['C'])),
        DataCell(Text(team.offensiveStats['tptfga']['C'])),
        DataCell(Text(team.offensiveStats['tptfgm']['C'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('SF')),
        DataCell(Text(team.offensiveStats['pts']['SF'])),
        DataCell(Text(team.offensiveStats['blk']['SF'])),
        DataCell(Text(team.offensiveStats['ast']['SF'])),
        DataCell(Text(team.offensiveStats['stl']['SF'])),
        DataCell(Text(team.offensiveStats['reb']['SF'])),
        DataCell(Text(team.offensiveStats['TOV']['SF'])),
        DataCell(Text(team.offensiveStats['fta']['SF'])),
        DataCell(Text(team.offensiveStats['ftm']['SF'])),
        DataCell(Text(team.offensiveStats['fga']['SF'])),
        DataCell(Text(team.offensiveStats['fgm']['SF'])),
        DataCell(Text(team.offensiveStats['tptfga']['SF'])),
        DataCell(Text(team.offensiveStats['tptfgm']['SF'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('SG')),
        DataCell(Text(team.offensiveStats['pts']['SG'])),
        DataCell(Text(team.offensiveStats['blk']['SG'])),
        DataCell(Text(team.offensiveStats['ast']['SG'])),
        DataCell(Text(team.offensiveStats['stl']['SG'])),
        DataCell(Text(team.offensiveStats['reb']['SG'])),
        DataCell(Text(team.offensiveStats['TOV']['SG'])),
        DataCell(Text(team.offensiveStats['fta']['SG'])),
        DataCell(Text(team.offensiveStats['ftm']['SG'])),
        DataCell(Text(team.offensiveStats['fga']['SG'])),
        DataCell(Text(team.offensiveStats['fgm']['SG'])),
        DataCell(Text(team.offensiveStats['tptfga']['SG'])),
        DataCell(Text(team.offensiveStats['tptfgm']['SG'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('PF')),
        DataCell(Text(team.offensiveStats['pts']['PF'])),
        DataCell(Text(team.offensiveStats['blk']['PF'])),
        DataCell(Text(team.offensiveStats['ast']['PF'])),
        DataCell(Text(team.offensiveStats['stl']['PF'])),
        DataCell(Text(team.offensiveStats['reb']['PF'])),
        DataCell(Text(team.offensiveStats['TOV']['PF'])),
        DataCell(Text(team.offensiveStats['fta']['PF'])),
        DataCell(Text(team.offensiveStats['ftm']['PF'])),
        DataCell(Text(team.offensiveStats['fga']['PF'])),
        DataCell(Text(team.offensiveStats['fgm']['PF'])),
        DataCell(Text(team.offensiveStats['tptfga']['PF'])),
        DataCell(Text(team.offensiveStats['tptfgm']['PF'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('PG')),
        DataCell(Text(team.offensiveStats['pts']['PG'])),
        DataCell(Text(team.offensiveStats['blk']['PG'])),
        DataCell(Text(team.offensiveStats['ast']['PG'])),
        DataCell(Text(team.offensiveStats['stl']['PG'])),
        DataCell(Text(team.offensiveStats['reb']['PG'])),
        DataCell(Text(team.offensiveStats['TOV']['PG'])),
        DataCell(Text(team.offensiveStats['fta']['PG'])),
        DataCell(Text(team.offensiveStats['ftm']['PG'])),
        DataCell(Text(team.offensiveStats['fga']['PG'])),
        DataCell(Text(team.offensiveStats['fgm']['PG'])),
        DataCell(Text(team.offensiveStats['tptfga']['PG'])),
        DataCell(Text(team.offensiveStats['tptfgm']['PG'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('Total')),
        DataCell(Text(team.offensiveStats['pts']['Total'])),
        DataCell(Text(team.offensiveStats['blk']['Total'])),
        DataCell(Text(team.offensiveStats['ast']['Total'])),
        DataCell(Text(team.offensiveStats['stl']['Total'])),
        DataCell(Text(team.offensiveStats['reb']['Total'])),
        DataCell(Text(team.offensiveStats['TOV']['Total'])),
        DataCell(Text(team.offensiveStats['fta']['Total'])),
        DataCell(Text(team.offensiveStats['ftm']['Total'])),
        DataCell(Text(team.offensiveStats['fga']['Total'])),
        DataCell(Text(team.offensiveStats['fgm']['Total'])),
        DataCell(Text(team.offensiveStats['tptfga']['Total'])),
        DataCell(Text(team.offensiveStats['tptfgm']['Total'])),
      ]),
    ]);
  }
}

class DefensiveStatsTable extends StatelessWidget {
  const DefensiveStatsTable({
    super.key,
    required this.statsColumns,
    required this.team,
  });

  final List<DataColumn> statsColumns;
  final Team team;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: statsColumns, rows: [
      DataRow(cells: [
        const DataCell(Text('C')),
        DataCell(Text(team.defensiveStats['pts']['C'])),
        DataCell(Text(team.defensiveStats['blk']['C'])),
        DataCell(Text(team.defensiveStats['ast']['C'])),
        DataCell(Text(team.defensiveStats['stl']['C'])),
        DataCell(Text(team.defensiveStats['reb']['C'])),
        DataCell(Text(team.defensiveStats['TOV']['C'])),
        DataCell(Text(team.defensiveStats['fta']['C'])),
        DataCell(Text(team.defensiveStats['ftm']['C'])),
        DataCell(Text(team.defensiveStats['fga']['C'])),
        DataCell(Text(team.defensiveStats['fgm']['C'])),
        DataCell(Text(team.defensiveStats['tptfga']['C'])),
        DataCell(Text(team.defensiveStats['tptfgm']['C'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('SF')),
        DataCell(Text(team.defensiveStats['pts']['SF'])),
        DataCell(Text(team.defensiveStats['blk']['SF'])),
        DataCell(Text(team.defensiveStats['ast']['SF'])),
        DataCell(Text(team.defensiveStats['stl']['SF'])),
        DataCell(Text(team.defensiveStats['reb']['SF'])),
        DataCell(Text(team.defensiveStats['TOV']['SF'])),
        DataCell(Text(team.defensiveStats['fta']['SF'])),
        DataCell(Text(team.defensiveStats['ftm']['SF'])),
        DataCell(Text(team.defensiveStats['fga']['SF'])),
        DataCell(Text(team.defensiveStats['fgm']['SF'])),
        DataCell(Text(team.defensiveStats['tptfga']['SF'])),
        DataCell(Text(team.defensiveStats['tptfgm']['SF'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('SG')),
        DataCell(Text(team.defensiveStats['pts']['SG'])),
        DataCell(Text(team.defensiveStats['blk']['SG'])),
        DataCell(Text(team.defensiveStats['ast']['SG'])),
        DataCell(Text(team.defensiveStats['stl']['SG'])),
        DataCell(Text(team.defensiveStats['reb']['SG'])),
        DataCell(Text(team.defensiveStats['TOV']['SG'])),
        DataCell(Text(team.defensiveStats['fta']['SG'])),
        DataCell(Text(team.defensiveStats['ftm']['SG'])),
        DataCell(Text(team.defensiveStats['fga']['SG'])),
        DataCell(Text(team.defensiveStats['fgm']['SG'])),
        DataCell(Text(team.defensiveStats['tptfga']['SG'])),
        DataCell(Text(team.defensiveStats['tptfgm']['SG'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('PF')),
        DataCell(Text(team.defensiveStats['pts']['PF'])),
        DataCell(Text(team.defensiveStats['blk']['PF'])),
        DataCell(Text(team.defensiveStats['ast']['PF'])),
        DataCell(Text(team.defensiveStats['stl']['PF'])),
        DataCell(Text(team.defensiveStats['reb']['PF'])),
        DataCell(Text(team.defensiveStats['TOV']['PF'])),
        DataCell(Text(team.defensiveStats['fta']['PF'])),
        DataCell(Text(team.defensiveStats['ftm']['PF'])),
        DataCell(Text(team.defensiveStats['fga']['PF'])),
        DataCell(Text(team.defensiveStats['fgm']['PF'])),
        DataCell(Text(team.defensiveStats['tptfga']['PF'])),
        DataCell(Text(team.defensiveStats['tptfgm']['PF'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('PG')),
        DataCell(Text(team.defensiveStats['pts']['PG'])),
        DataCell(Text(team.defensiveStats['blk']['PG'])),
        DataCell(Text(team.defensiveStats['ast']['PG'])),
        DataCell(Text(team.defensiveStats['stl']['PG'])),
        DataCell(Text(team.defensiveStats['reb']['PG'])),
        DataCell(Text(team.defensiveStats['TOV']['PG'])),
        DataCell(Text(team.defensiveStats['fta']['PG'])),
        DataCell(Text(team.defensiveStats['ftm']['PG'])),
        DataCell(Text(team.defensiveStats['fga']['PG'])),
        DataCell(Text(team.defensiveStats['fgm']['PG'])),
        DataCell(Text(team.defensiveStats['tptfga']['PG'])),
        DataCell(Text(team.defensiveStats['tptfgm']['PG'])),
      ]),
      DataRow(cells: [
        const DataCell(Text('Total')),
        DataCell(Text(team.defensiveStats['pts']['Total'])),
        DataCell(Text(team.defensiveStats['blk']['Total'])),
        DataCell(Text(team.defensiveStats['ast']['Total'])),
        DataCell(Text(team.defensiveStats['stl']['Total'])),
        DataCell(Text(team.defensiveStats['reb']['Total'])),
        DataCell(Text(team.defensiveStats['TOV']['Total'])),
        DataCell(Text(team.defensiveStats['fta']['Total'])),
        DataCell(Text(team.defensiveStats['ftm']['Total'])),
        DataCell(Text(team.defensiveStats['fga']['Total'])),
        DataCell(Text(team.defensiveStats['fgm']['Total'])),
        DataCell(Text(team.defensiveStats['tptfga']['Total'])),
        DataCell(Text(team.defensiveStats['tptfgm']['Total'])),
      ]),
    ]);
  }
}
