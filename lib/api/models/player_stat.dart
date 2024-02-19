class PlayerStat {
  final String longName;
  final String mins;
  final String pts;
  final String reb;
  final String ast;
  final String blk;
  final String stl;
  final String tov;
  final String plusMinus;
  final String pf;
  final String tptfgp;
  final String tptfga;
  final String tptfgm;

  PlayerStat(
      this.longName,
      this.mins,
      this.pts,
      this.reb,
      this.ast,
      this.blk,
      this.stl,
      this.tov,
      this.plusMinus,
      this.pf,
      this.tptfgp,
      this.tptfga,
      this.tptfgm);

  factory PlayerStat.fromJson(Map<String, dynamic> json) {
    return PlayerStat(
      json['longName'],
      json['mins'],
      json['pts'],
      json['reb'],
      json['ast'],
      json['blk'],
      json['stl'],
      json['TOV'],
      json['plusMinus'],
      json['PF'],
      json['tptfgp'],
      json['tptfga'],
      json['tptfgm'],
    );
  }
}
