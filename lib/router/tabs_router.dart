import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        NotesRoute(),
        NewsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(82, 41, 17, 0.21),
                  offset: Offset(2, 4),
                  blurRadius: 25,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 50,
              elevation: 50,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/default/home.svg'),
                  activeIcon: SvgPicture.asset('assets/icons/active/home.svg'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/default/notes.svg'),
                  activeIcon: SvgPicture.asset('assets/icons/active/notes.svg'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/default/news.svg'),
                  activeIcon: SvgPicture.asset('assets/icons/active/news.svg'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/default/settings.svg'),
                  activeIcon:
                      SvgPicture.asset('assets/icons/active/settings.svg'),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
