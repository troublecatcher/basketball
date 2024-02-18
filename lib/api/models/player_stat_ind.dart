class PlayerIndStat {
  final String blk;
  final String fga;
  final String DefReb;
  final String ast;
  final String ftp;
  final String tptfgp;
  final String tptfgm;
  final String trueShootingPercentage;
  final String stl;
  final String fgm;
  final String pts;
  final String reb;
  final String fgp;
  final String effectiveShootingPercentage;
  final String fta;
  final String mins;
  final String gamesPlayed;
  final String TOV;
  final String tptfga;
  final String OffReb;
  final String ftm;

  PlayerIndStat(
      this.blk,
      this.fga,
      this.DefReb,
      this.ast,
      this.ftp,
      this.tptfgp,
      this.tptfgm,
      this.trueShootingPercentage,
      this.stl,
      this.fgm,
      this.pts,
      this.reb,
      this.fgp,
      this.effectiveShootingPercentage,
      this.fta,
      this.mins,
      this.gamesPlayed,
      this.TOV,
      this.tptfga,
      this.OffReb,
      this.ftm);
  factory PlayerIndStat.fromJson(Map<String, dynamic>? json) {
    return PlayerIndStat(
      json!['blk'],
      json['fga'],
      json['DefReb'],
      json['ast'],
      json['ftp'],
      json['tptfgp'],
      json['tptfgm'],
      json['trueShootingPercentage'],
      json['stl'],
      json['fgm'],
      json['pts'],
      json['reb'],
      json['fgp'],
      json['effectiveShootingPercentage'],
      json['fta'],
      json['mins'],
      json['gamesPlayed'],
      json['TOV'],
      json['tptfga'],
      json['OffReb'],
      json['ftm'],
    );
  }
}
