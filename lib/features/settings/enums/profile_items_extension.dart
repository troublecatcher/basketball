import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/settings/enums/profile_items.dart';
import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';

extension ProfileExtension on ProfileItems {
  void performAction(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController statusController,
    ProfilePageController profilePageController,
  ) {
    switch (this) {
      case ProfileItems.changeName:
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Profile Name'),
                  content: CupertinoTextField(
                    controller: nameController,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => context.router.pop(),
                      child: const Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Save'),
                      onPressed: () {
                        profilePageController.changeName(nameController.text);
                        context.router.pop();
                      },
                    ),
                  ],
                ));
        break;
      case ProfileItems.changeStatus:
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Profile Status'),
                  content: CupertinoTextField(
                    controller: statusController,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => context.router.pop(),
                      child: const Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Save'),
                      onPressed: () {
                        profilePageController
                            .changeStatus(statusController.text);
                        context.router.pop();
                      },
                    ),
                  ],
                ));
        break;
    }
  }
}
