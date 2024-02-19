import 'package:flutter/material.dart';

Map<int, Widget> pages(BuildContext context) {
  return {
    0: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 40,
            horizontal: MediaQuery.of(context).size.width / 40),
        child: const Text('Player Stats',
            style: TextStyle(fontWeight: FontWeight.w600))),
    1: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 40,
            horizontal: MediaQuery.of(context).size.width / 40),
        child: const Text('Team Stats',
            style: TextStyle(fontWeight: FontWeight.w600))),
  };
}
