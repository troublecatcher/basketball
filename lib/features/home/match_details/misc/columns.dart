import 'package:flutter/material.dart';

const playerStatsColumns = [
  DataColumn(label: Text('PLAYER')),
  DataColumn(label: Text('MIN')),
  DataColumn(label: Text('PTS')),
  DataColumn(label: Text('REB')),
  DataColumn(label: Text('AST')),
  DataColumn(label: Text('BLK')),
  DataColumn(label: Text('STL')),
  DataColumn(label: Text('TOV')),
  DataColumn(label: Text('+/-')),
  DataColumn(label: Text('PF')),
  DataColumn(label: Text('FGP')),
  DataColumn(label: Text('FGA')),
  DataColumn(label: Text('FGM')),
];
const lineScoreColumns = [
  DataColumn(label: Text('TEAM')),
  DataColumn(label: Text('Q1')),
  DataColumn(label: Text('Q2')),
  DataColumn(label: Text('Q3')),
  DataColumn(label: Text('Q4')),
  DataColumn(label: Text('TOTAL')),
];
List<DataColumn> teamStatsColumns(String home, String away) {
  return [
    const DataColumn(
      label: Text('STATS'),
    ),
    DataColumn(
        label: Text(
      home,
      maxLines: 1,
    )),
    DataColumn(
        label: Text(
      away,
      maxLines: 1,
    )),
  ];
}
