import 'package:flutter/material.dart';

import '../../consts.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String child;

  const InfoWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(kBorderRadius), color: kGrey43),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(child),
          ),
        ],
      ),
    );
  }
}
