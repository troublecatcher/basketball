class BoxScore {
  final String gameStatus;
  final String? arenaCapacity;
  final String? referees;
  final String? arena;
  final String? attendance;
  final String? gameLocation;
  final Map<String, dynamic>? playerStats;
  final Map<String, dynamic>? teamStats;
  final Map<String, dynamic>? lineScore;

  BoxScore(
      this.gameStatus,
      this.arenaCapacity,
      this.referees,
      this.arena,
      this.attendance,
      this.gameLocation,
      this.playerStats,
      this.teamStats,
      this.lineScore);

  factory BoxScore.fromJson(Map<String, dynamic> json) {
    final body = json['body'];
    return BoxScore(
      body['gameStatus'],
      body['arenaCapacity'],
      body['referees'],
      body['arena'],
      body['attendance'],
      body['gameLocation'],
      body['playerStats'],
      body['teamStats'],
      body['lineScore'],
    );
  }
}
