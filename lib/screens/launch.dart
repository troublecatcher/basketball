import 'package:auto_route/auto_route.dart';
import 'package:basketball/main.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

late PageController pageController;

@RoutePage()
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 100.h, right: 20.w, left: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextPageButton(1),
              SkipButton(),
            ],
          ),
        )
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100.h, right: 20.w, left: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/onboarding/2.png')),
                SizedBox(height: 20.h),
                Text(
                    'Choose your favorite team from the world\'s sports communities.',
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextPageButton(2),
                SkipButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100.h, right: 20.w, left: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/onboarding/3.png')),
                SizedBox(height: 20.h),
                Text(
                  'Follow the basketball news, as well as the matches in real time.',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CupertinoButton(
                color: const Color.fromRGBO(36, 107, 253, 1),
                child: const Text('Let\'s get started!'),
                onPressed: () async {
                  await locator<SharedPreferences>()
                      .setBool('isFirstTime', false);
                  context.router.replace(const HomeRoute());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NextPageButton extends StatelessWidget {
  final int page;
  const NextPageButton(
    this.page, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: const Color.fromRGBO(36, 107, 253, 1),
        onPressed: () => pageController.animateToPage(page,
            duration: const Duration(milliseconds: 200), curve: Curves.ease),
        child: const Text('Next'));
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () async {
          await locator<SharedPreferences>().setBool('isFirstTime', false);

          context.router.replace(const HomeRoute());
        },
        child: const Text('Skip', style: TextStyle(color: Colors.grey)));
  }
}
