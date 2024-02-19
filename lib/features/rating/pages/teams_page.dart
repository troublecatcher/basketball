import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/features/rating/rating_screen.dart';
import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({
    super.key,
    required this.teams,
  });

  final AsyncValue<String> teams;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return teams.when(
        data: (teamData) {
          final teamsJson = jsonDecode(teamData);
          teamList =
              teamsJson['body'].map((team) => Team.fromJson(team)).toList();
          return ListView.builder(
              itemCount: teamList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      context.router.push(TeamInfoRoute(team: teamList[index])),
                  child: ListTile(
                    leading: Image.network(
                      teamList[index].espnLogo1,
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) =>
                          const ErrorImageWidget(side: 40),
                    ),
                    title: Text(
                        '${teamList[index].teamCity} ${teamList[index].teamName}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(teamList[index].teamAbv),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                );
              });
        },
        loading: () => const LoadingIndicator(isCentered: true),
        error: (error, stackTrace) => ErrorTextWidget(error: error),
      );
    });
  }
}
