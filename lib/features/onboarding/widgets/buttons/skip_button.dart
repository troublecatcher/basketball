import 'package:auto_route/auto_route.dart';
import 'package:basketball/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../../router/router.dart';

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
        child: Text('Skip', style: TextStyle(color: kGrey)));
  }
}
