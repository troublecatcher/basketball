import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/page_one.dart';
import 'pages/page_three.dart';
import 'pages/page_two.dart';

late PageController pageController;

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
