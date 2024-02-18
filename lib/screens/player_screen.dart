import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_ind.dart';
import 'package:flutter/material.dart';

import 'match_details.dart';

@RoutePage()
class PlayerScreen extends StatelessWidget {
  final Player player;
  final PlayerIndStat? stat;
  const PlayerScreen(this.player, {super.key, this.stat});

  @override
  Widget build(BuildContext context) {
    const playerStatColumns = [
      DataColumn(label: Text('Performance Indicator')),
      DataColumn(label: Text('Value')),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          player.longName,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.network(
                      player.imgUrl ?? 'assets/logo.png',
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/logo.png',
                            width: 200, height: 200);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                InfoWidget(title: 'Name', child: player.longName),
                InfoWidget(title: 'Team', child: player.team),
              ],
            ),
            if (stat != null)
              DataTable(columns: playerStatColumns, rows: [
                DataRow(cells: [
                  const DataCell(Text('Games played')),
                  DataCell(Text(stat!.gamesPlayed)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('MINS')),
                  DataCell(Text(stat!.mins)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('PTS')),
                  DataCell(Text(stat!.pts)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('REB')),
                  DataCell(Text(stat!.reb)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('DEF REB')),
                  DataCell(Text(stat!.DefReb)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('OFF REB')),
                  DataCell(Text(stat!.OffReb)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('AST')),
                  DataCell(Text(stat!.ast)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('BLK')),
                  DataCell(Text(stat!.blk)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('STL')),
                  DataCell(Text(stat!.stl)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('TOV')),
                  DataCell(Text(stat!.TOV)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FGA')),
                  DataCell(Text(stat!.fga)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FGM')),
                  DataCell(Text(stat!.fgm)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FGP')),
                  DataCell(Text(stat!.fgp)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FTP')),
                  DataCell(Text(stat!.ftp)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FTM')),
                  DataCell(Text(stat!.ftm)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('FTA')),
                  DataCell(Text(stat!.fta)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('TPTFGA')),
                  DataCell(Text(stat!.tptfga)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('TPTFGM')),
                  DataCell(Text(stat!.tptfgm)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('TPTFGP')),
                  DataCell(Text(stat!.tptfgp)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('True Shooting Percentage')),
                  DataCell(Text(stat!.trueShootingPercentage)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Effective Shooting Percentage')),
                  DataCell(Text(stat!.effectiveShootingPercentage)),
                ]),
              ])
          ],
        ),
      )),
    );
  }
}
