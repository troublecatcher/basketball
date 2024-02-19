import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NameField extends StatelessWidget {
  const NameField({
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
            profilePageController.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
