import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../api/models/match.dart';

class ImageWidget extends StatelessWidget {
  final List teamList;
  final Match match;
  final String ha;
  const ImageWidget(
      {super.key,
      required this.teamList,
      required this.match,
      required this.ha});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(ha == 'h' ? 'HOME' : 'AWAY',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.black)),
        Transform.flip(
          flipX: ha == 'h' ? false : true,
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 60,
            width: 60,
          ),
        ),
      ],
    );
  }
}
