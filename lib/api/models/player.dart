import 'package:basketball/api/models/player_stat_individual.dart';

class Player {
  final String playerID;
  final String team;
  final String longName;
  final String teamID;
  final String? imgUrl;
  final PlayerStatIndividual? stat;

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      json['playerID'],
      json['team'],
      json['longName'],
      json['teamID'],
    );
  }

  Player(this.playerID, this.team, this.longName, this.teamID,
      {this.imgUrl, this.stat});
}
