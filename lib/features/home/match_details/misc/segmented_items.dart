import 'package:flutter/material.dart';

Map<int, Widget> pages(BuildContext context) {
  return {
    0: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 30,
            horizontal: MediaQuery.of(context).size.width / 40),
        child: const Text('Matchup',
            style: TextStyle(fontWeight: FontWeight.w600))),
    1: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 30,
            horizontal: MediaQuery.of(context).size.width / 40),
        child: const Text('Game Stats',
            style: TextStyle(fontWeight: FontWeight.w600))),
    2: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 30,
            horizontal: MediaQuery.of(context).size.width / 40),
        child: const Text('Player Stats',
            style: TextStyle(fontWeight: FontWeight.w600))),
  };
}

Map<int, Widget> teams(BuildContext context, String home, String away) {
  return {
    0: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 40),
        child: Text(home)),
    1: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 40),
        child: Text(away)),
  };
}
