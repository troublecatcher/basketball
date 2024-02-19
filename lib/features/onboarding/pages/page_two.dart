import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buttons/next_page_button.dart';
import '../widgets/page_body.dart';
import '../widgets/page_tail.dart';
import '../widgets/buttons/skip_button.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Body(
            content: [
              Center(child: Image.asset('assets/onboarding/2.png')),
              SizedBox(height: 20.h),
              Text(
                  'Choose your favorite team from the world\'s sports communities.',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          const Tail(
            content: [
              NextPageButton(2),
              SkipButton(),
            ],
          ),
        ],
      ),
    );
  }
}
