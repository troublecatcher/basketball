import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_individual.dart';
import 'package:basketball/features/rating/player/widgets/player_image.dart';
import 'package:basketball/features/rating/player/widgets/player_info.dart';
import 'package:basketball/features/rating/player/widgets/player_stat_table.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlayerInfoScreen extends StatelessWidget {
  final Player player;
  final PlayerStatIndividual? stat;
  const PlayerInfoScreen(this.player, {super.key, this.stat});

  @override
  Widget build(BuildContext context) {
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
            PlayerImage(player: player),
            PlayerInfo(player: player),
            if (stat != null) PlayerStatTable(stat: stat)
          ],
        ),
      )),
    );
  }
}
