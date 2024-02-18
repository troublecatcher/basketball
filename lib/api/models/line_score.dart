class LineScore {
  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String totalPts;

  LineScore(this.q1, this.q2, this.q3, this.q4, this.totalPts);

  factory LineScore.fromJson(Map<String, dynamic> json) {
    return LineScore(
      json['1Q'],
      json['2Q'],
      json['3Q'],
      json['4Q'],
      json['totalPts'],
    );
  }

  Map<String, String> lineScoreToMap() {
    return <String, String>{
      '1Q': q1,
      '2Q': q2,
      '3Q': q3,
      '4Q': q4,
      'Total points': totalPts,
    };
  }
}
