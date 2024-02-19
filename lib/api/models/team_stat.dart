class TeamStat {
  final String pts;
  final String reb;
  final String ast;
  final String blk;
  final String stl;
  final String tov;
  final String ptsOffTOV;
  final String pf;
  final String fta;
  final String ftm;
  final String ftp;
  final String fga;
  final String fgm;
  final String fgp;
  final String tptfga;
  final String tptfgm;
  final String tptfgp;
  final String fastBreakPts;
  final String pointsInPaint;
  final String offReb;
  final String defReb;
  final String largestLead;
  final String flagrantFouls;
  final String tech;

  TeamStat(
      this.pts,
      this.reb,
      this.ast,
      this.blk,
      this.stl,
      this.tov,
      this.ptsOffTOV,
      this.pf,
      this.fta,
      this.ftm,
      this.ftp,
      this.fga,
      this.fgm,
      this.fgp,
      this.tptfga,
      this.tptfgm,
      this.tptfgp,
      this.fastBreakPts,
      this.pointsInPaint,
      this.offReb,
      this.defReb,
      this.largestLead,
      this.flagrantFouls,
      this.tech);

  factory TeamStat.fromJson(Map<String, dynamic> json) {
    return TeamStat(
      json['pts'],
      json['reb'],
      json['ast'],
      json['blk'],
      json['stl'],
      json['TOV'],
      json['ptsOffTOV'],
      json['PF'],
      json['fta'],
      json['ftm'],
      json['ftp'],
      json['fga'],
      json['fgm'],
      json['fgp'],
      json['tptfga'],
      json['tptfgm'],
      json['tptfgp'],
      json['fastBreakPts'],
      json['pointsInPaint'],
      json['OffReb'],
      json['DefReb'],
      json['largestLead'],
      json['flagrantFouls'],
      json['tech'],
    );
  }

  Map<String, String> teamStatToMap() {
    return <String, String>{
      'Points': pts,
      'Rebounds': reb,
      'Assists': ast,
      'Blocks': blk,
      'Steals': stl,
      'Turnovers': tov,
      'Points off Turnovers': ptsOffTOV,
      'Personal Fouls': pf,
      'Free Throws Attempted': fta,
      'Free Throws Made': ftm,
      'Free Throws Percentage': ftp,
      'Field Goals Attempted': fga,
      'Field Goals Made': fgm,
      'Field Goals Percentage': fgp,
      '3pts FG Attempted': tptfga,
      '3pts FG Made': tptfgm,
      '3pts FG Percentage': tptfgp,
      'Fast Break Points': fastBreakPts,
      'Points in Paint': pointsInPaint,
      'Offensive Rebounds': offReb,
      'Defensive Rebounds': defReb,
      'Largest Lead': largestLead,
      'Flagrant Fouls': flagrantFouls,
      'Technical Fouls': tech,
    };
  }
}
