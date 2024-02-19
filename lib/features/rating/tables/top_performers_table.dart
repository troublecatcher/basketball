import 'package:basketball/api/models/team.dart';
import 'package:basketball/features/rating/tables/columns.dart';
import 'package:flutter/material.dart';

class TopPerformersTable extends StatelessWidget {
  const TopPerformersTable({
    super.key,
    required this.team,
  });

  final Team team;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: topPerformersColumns, rows: [
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
    ]);
  }
}
