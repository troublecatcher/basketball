import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_individual.dart';
import 'package:basketball/api/models/team.dart';
import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../shared/error_image_widget.dart';

@RoutePage()
class RosterInfoScreen extends StatelessWidget {
  final Team team;

  const RosterInfoScreen(this.team, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Player> roster = [];
    team.roster.forEach((k, v) => roster.add(Player(
        k, v['team'], v['longName'], v['teamID'],
        imgUrl: v['espnHeadshot'],
        stat: v['stats'] == null
            ? null
            : PlayerStatIndividual.fromJson(v['stats']))));
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
                onTap: () => context.router.push(PlayerInfoRoute(
                    player: roster[index], stat: roster[index].stat)),
                child: ListTile(
                  leading: Image.network(
                    roster[index].imgUrl!,
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) =>
                        const ErrorImageWidget(side: 80),
                  ),
                  title: Text(roster[index].longName,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
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
