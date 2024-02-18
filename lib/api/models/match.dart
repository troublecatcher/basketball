class GivenMatch {
  final String away;
  final String home;
  final String teamIDaway;
  final String teamIDhome;
  final String gameID;
  final String awayPts;
  final String homePts;
  final String gameClock;
  final String gameStatus;
  final String gameTime;

  GivenMatch(
    this.away,
    this.home,
    this.teamIDaway,
    this.teamIDhome,
    this.gameID,
    this.awayPts,
    this.homePts,
    this.gameClock,
    this.gameStatus,
    this.gameTime,
  );

  factory GivenMatch.fromJson(Map<String, dynamic> json) {
    return GivenMatch(
      json['away'],
      json['home'],
      json['teamIDAway'],
      json['teamIDHome'],
      json['gameID'],
      json['awayPts'],
      json['homePts'],
      json['gameClock'],
      json['gameStatus'],
      json['gameTime_epoch'],
    );
  }
}
