class Team {
  final String teamAbv;
  final String teamCity;
  final String teamName;
  final String espnLogo1;
  final String teamID;
  final Map<String, dynamic> roster;
  final Map<String, dynamic> currentStreak;
  final String loss;
  final String wins;
  final String ppg;
  final String oppg;
  final String division;
  final String conference;
  final String conferenceAbv;
  final Map<String, dynamic> topPerformers;
  final Map<String, dynamic> defensiveStats;
  final Map<String, dynamic> offensiveStats;

  Team({
    required this.teamAbv,
    required this.teamCity,
    required this.teamName,
    required this.espnLogo1,
    required this.teamID,
    required this.roster,
    required this.currentStreak,
    required this.loss,
    required this.wins,
    required this.ppg,
    required this.oppg,
    required this.division,
    required this.conference,
    required this.conferenceAbv,
    required this.topPerformers,
    required this.defensiveStats,
    required this.offensiveStats,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamAbv: json['teamAbv'],
      teamCity: json['teamCity'],
      teamName: json['teamName'],
      espnLogo1: json['espnLogo1'],
      teamID: json['teamID'],
      roster: json['Roster'],
      currentStreak: json['currentStreak'],
      loss: json['loss'],
      wins: json['wins'],
      ppg: json['ppg'],
      oppg: json['oppg'],
      division: json['division'],
      conference: json['conference'],
      conferenceAbv: json['conferenceAbv'],
      topPerformers: json['topPerformers'],
      defensiveStats: json['defensiveStats'],
      offensiveStats: json['offensiveStats'],
    );
  }
}
