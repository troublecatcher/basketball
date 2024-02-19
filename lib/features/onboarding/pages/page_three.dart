import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../consts.dart';
import '../../../main.dart';
import '../../../router/router.dart';
import '../widgets/page_body.dart';
import '../widgets/page_tail.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Body(
            content: [
              Center(child: Image.asset('assets/onboarding/3.png')),
              SizedBox(height: 20.h),
              Text(
                'Follow the basketball news, as well as the matches in real time.',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Tail(
            content: [
              CupertinoButton(
                color: kBlue,
                child: const Text('Let\'s get started!'),
                onPressed: () async {
                  await locator<SharedPreferences>()
                      .setBool('isFirstTime', false);
                  context.router.replace(const HomeRoute());
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
