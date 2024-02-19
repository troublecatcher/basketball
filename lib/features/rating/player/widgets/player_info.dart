import 'package:basketball/api/models/player.dart';
import 'package:basketball/features/shared/info_widget.dart';
import 'package:flutter/material.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoWidget(title: 'Name', child: player.longName),
        InfoWidget(title: 'Team', child: player.team),
      ],
    );
  }
}
