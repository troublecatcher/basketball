import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreBox extends StatelessWidget {
  final String home;
  final String away;
  final String status;
  final String clock;

  const ScoreBox({
    super.key,
    required this.home,
    required this.away,
    required this.status,
    required this.clock,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$home - $away',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
        Text(status,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
        Text(clock,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
