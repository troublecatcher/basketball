import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamInfoWidget extends StatelessWidget {
  final String imgUrl;
  final String city;
  final String name;

  const TeamInfoWidget({
    super.key,
    required this.imgUrl,
    required this.city,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imgUrl,
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) =>
              const ErrorImageWidget(side: 60),
        ),
        Text(city,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
        Text(name,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
