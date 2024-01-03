import 'package:auto_route/auto_route.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _contentAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, 2.5),
      end: const Offset(0, 0.75),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    _contentAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutExpo,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoAnimation,
              child: SvgPicture.asset('assets/logo.svg'),
            ),
            const Spacer(),
            FadeTransition(
              opacity: _contentAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 2),
                  end: const Offset(0, 0),
                ).animate(_animationController),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 62,
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(244, 117, 44, 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    context.router.replace(const MainRoute()),
                                child: Text(
                                  'Continue',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'SrbijaSans',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text:
                                    'By clicking the "Continue" button, you agree to our ',
                              ),
                              TextSpan(
                                text: 'Terms of use',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router
                                        .push(const TermsOfUseRoute());
                                  },
                              ),
                              const TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router
                                        .push(const PrivacyPolicyRoute());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Restoring your purchases...'),
                            ),
                          );
                        },
                        child: const Text(
                          'Restore',
                          style: TextStyle(
                            fontFamily: 'SrbijaSans',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
