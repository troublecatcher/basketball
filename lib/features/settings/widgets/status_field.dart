import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StatusField extends StatelessWidget {
  const StatusField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: GetBuilder(
        init: profilePageController,
        builder: (_) {
          return Text(
            profilePageController.status,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
