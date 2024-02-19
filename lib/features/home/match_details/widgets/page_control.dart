import 'package:basketball/consts.dart';
import 'package:basketball/features/home/match_details/match_details_screen.dart';
import 'package:basketball/features/home/match_details/misc/segmented_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageControl extends StatelessWidget {
  const PageControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: matchDetailsController,
      builder: (controller) => CupertinoSlidingSegmentedControl(
          backgroundColor: kGrey24,
          thumbColor: kOrange,
          groupValue: matchDetailsController.pageIndex,
          children: pages(context),
          onValueChanged: (value) {
            matchDetailsController.updatePageIndex(value!);
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
          }),
    );
  }
}
