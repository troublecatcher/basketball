import 'package:basketball/api/models/team.dart';
import 'package:flutter/material.dart';

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
