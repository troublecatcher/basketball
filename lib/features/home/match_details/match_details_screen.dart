import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/team.dart';
import 'package:basketball/api/models/given_match.dart';
import 'package:basketball/features/home/match_details/widgets/game_stats.dart';
import 'package:basketball/features/home/match_details/widgets/matchup.dart';
import 'package:basketball/features/home/match_details/widgets/page_control.dart';
import 'package:basketball/features/home/match_details/widgets/player_stats.dart';
import 'package:basketball/features/home/match_details/widgets/score_box.dart';
import 'package:basketball/features/home/match_details/widgets/team_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

late StateProvider<String> gameIDProvider;
late MatchDetailsController matchDetailsController;
late PageController pageController;

@RoutePage()
class MatchDetailsScreen extends ConsumerStatefulWidget {
  final GivenMatch match;
  final Team teamHome;
  final Team teamAway;
  const MatchDetailsScreen(
      {Key? key,
      required this.match,
      required this.teamHome,
      required this.teamAway})
      : super(key: key);

  @override
  MatchDetailsScreenState createState() => MatchDetailsScreenState();
}

class MatchDetailsScreenState extends ConsumerState<MatchDetailsScreen> {
  @override
  void initState() {
    super.initState();
    matchDetailsController = MatchDetailsController();
    gameIDProvider = StateProvider<String>((ref) => widget.match.gameID);
    pageController =
        PageController(initialPage: matchDetailsController.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TeamInfoWidget(
                      imgUrl: widget.teamHome.espnLogo1,
                      city: widget.teamHome.teamCity,
                      name: widget.teamHome.teamName,
                    ),
                  ),
                  Expanded(
                    child: ScoreBox(
                      home: widget.match.homePts,
                      away: widget.match.awayPts,
                      status: widget.match.gameStatus,
                      clock: widget.match.gameClock,
                    ),
                  ),
                  Expanded(
                    child: TeamInfoWidget(
                      imgUrl: widget.teamAway.espnLogo1,
                      city: widget.teamAway.teamCity,
                      name: widget.teamAway.teamName,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.match.gameStatus == 'Not Started Yet')
              const SizedBox.shrink()
            else
              const Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageControl(),
                  ],
                ),
              ),
            if (widget.match.gameStatus == 'Not Started Yet')
              const Center(child: Text('The game has not started yet'))
            else
              Expanded(
                flex: 8,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Matchup(ref: ref, widget: widget),
                    GameStats(ref: ref, widget: widget),
                    PlayerStats(ref: ref, widget: widget),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MatchDetailsController extends GetxController {
  int pageIndex = 0;
  int teamIndex = 0;

  void updatePageIndex(int value) {
    pageIndex = value;
    update();
  }

  void updateTeamIndex(int value) {
    teamIndex = value;
    update();
  }
}
