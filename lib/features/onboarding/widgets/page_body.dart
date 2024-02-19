import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  final List<Widget> content;
  const Body({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100.h, right: 20.w, left: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...content,
        ],
      ),
    );
  }
}
