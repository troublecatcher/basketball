import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/player.dart';
import 'package:basketball/api/models/player_stat_individual.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/features/rating/rating_screen.dart';
import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({
    super.key,
    required this.players,
    required this.teams,
  });

  final AsyncValue<String> players;
  final AsyncValue<String> teams;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return players.when(
        data: (playersData) {
          final playersJson = jsonDecode(playersData);
          playerList = playersJson['body']
              .map((player) => Player.fromJson(player))
              .toList();

          return ListView.builder(
              itemCount: playerList.length,
              itemBuilder: (context, index) {
                String? playerImageUrl;
                Map<String, dynamic>? playerStat;
                return GestureDetector(
                  onTap: () => playerImageUrl == null
                      ? context.router
                          .push(PlayerInfoRoute(player: playerList[index]))
                      : context.router.push(PlayerInfoRoute(
                          player: Player(
                            playerList[index].playerID,
                            playerList[index].team,
                            playerList[index].longName,
                            playerList[index].teamID,
                            imgUrl: playerImageUrl,
                          ),
                          stat: PlayerStatIndividual.fromJson(playerStat))),
                  child: ListTile(
                    leading: teams.when(
                      data: (teamData) {
                        final teamsJson = jsonDecode(teamData);
                        teamList = teamsJson['body']
                            .map((team) => Team.fromJson(team))
                            .toList();
                        for (var team in teamList) {
                          if (team.roster
                              .containsKey(playerList[index].playerID)) {
                            playerImageUrl =
                                team.roster[playerList[index].playerID]
                                    ['espnHeadshot'];
                            playerStat = team.roster[playerList[index].playerID]
                                ['stats'];
                          }
                        }
                        if (playerImageUrl == null) {
                          return const ErrorImageWidget(side: 80);
                        } else {
                          return Image.network(
                            playerImageUrl!,
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) =>
                                const ErrorImageWidget(side: 80),
                          );
                        }
                      },
                      loading: () => const LoadingIndicator(isCentered: false),
                      error: (error, stackTrace) =>
                          ErrorTextWidget(error: error),
                    ),
                    title: Text(playerList[index].longName,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(playerList[index].team),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                );
              });
        },
        loading: () => const LoadingIndicator(isCentered: false),
        error: (error, stackTrace) => ErrorTextWidget(error: error),
      );
    });
  }
}
