import 'package:basketball/consts.dart';
import 'package:flutter/cupertino.dart';

import '../../onboarding_screen.dart';

class NextPageButton extends StatelessWidget {
  final int page;
  const NextPageButton(
    this.page, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        borderRadius: BorderRadius.all(kBorderRadius),
        color: kBlue,
        onPressed: () => pageController.animateToPage(page,
            duration: const Duration(milliseconds: 200), curve: Curves.ease),
        child: const Text('Next'));
  }
}
