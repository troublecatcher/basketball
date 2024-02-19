import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buttons/next_page_button.dart';
import '../widgets/page_body.dart';
import '../widgets/page_tail.dart';
import '../widgets/buttons/skip_button.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Body(
          content: [
            Center(child: Image.asset('assets/onboarding/1.png')),
            Text(
              'Discover all about Basketball',
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              'Immerse yourself in your favorite basketball matches with our app!',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(101, 101, 107, 1)),
            ),
            Text(
              'Well, let\'s begin!',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(101, 101, 107, 1)),
            ),
          ],
        ),
        const Tail(
          content: [
            NextPageButton(1),
            SkipButton(),
          ],
        ),
      ],
    );
  }
}
