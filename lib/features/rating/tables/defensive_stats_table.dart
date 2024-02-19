import 'package:basketball/api/models/team.dart';
import 'package:flutter/material.dart';

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
