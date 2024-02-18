import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_ind.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RosterScreen extends StatelessWidget {
  final Team team;

  RosterScreen(this.team);

  @override
  Widget build(BuildContext context) {
    List<Player> roster = [];
    team.Roster.forEach((k, v) => roster.add(Player(
        k, v['team'], v['longName'], v['teamID'],
        imgUrl: v['espnHeadshot'],
        stat: v['stats'] == null ? null : PlayerIndStat.fromJson(v['stats']))));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Roster – ${team.teamAbv}',
        ),
      ),
      body: SafeArea(
          child: Center(
        child: ListView.builder(
            itemCount: roster.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.router.push(PlayerRoute(
                    player: roster[index], stat: roster[index].stat)),
                child: ListTile(
                  leading: Image.network(
                    roster[index].imgUrl!,
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/logo.png',
                          width: 80, height: 80);
                    },
                  ),
                  title: Text(roster[index].longName,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(roster[index].team),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white),
                ),
              );
            }),
      )),
    );
  }
}
