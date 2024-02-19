import 'package:basketball/api/models/player_stat_individual.dart';
import 'package:basketball/features/rating/tables/columns.dart';
import 'package:flutter/material.dart';

class PlayerStatTable extends StatelessWidget {
  const PlayerStatTable({
    super.key,
    required this.stat,
  });

  final PlayerStatIndividual? stat;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: playerStatColumns, rows: [
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
        DataCell(Text(stat!.defReb)),
      ]),
      DataRow(cells: [
        const DataCell(Text('OFF REB')),
        DataCell(Text(stat!.offReb)),
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
        DataCell(Text(stat!.tov)),
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
    ]);
  }
}
