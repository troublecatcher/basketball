import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../consts.dart';
import 'router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      transitionBuilder: (context, child, animation) => child,
      routes: const [
        HomeRoute(),
        NewsRoute(),
        RatingRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kGrey34,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/default/home.svg'),
                activeIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Main',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 14.sp,
                        )),
                    SvgPicture.asset('assets/icons/default/circle.svg'),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/default/explore.svg'),
                activeIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Explore',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 14.sp,
                        )),
                    SvgPicture.asset('assets/icons/default/circle.svg'),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/default/rating.svg'),
                activeIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rating',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 14.sp,
                        )),
                    SvgPicture.asset('assets/icons/default/circle.svg'),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/default/profile.svg'),
                activeIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('My Profile',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 14.sp,
                        )),
                    SvgPicture.asset('assets/icons/default/circle.svg'),
                  ],
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
