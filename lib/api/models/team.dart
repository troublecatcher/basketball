class Team {
  final String teamAbv;
  final String teamCity;
  final String teamName;
  final String espnLogo1;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      json['teamAbv'],
      json['teamCity'],
      json['teamName'],
      json['espnLogo1'],
    );
  }

  Team(this.teamAbv, this.teamCity, this.teamName, this.espnLogo1);
}
