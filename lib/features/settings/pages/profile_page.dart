import 'package:basketball/features/settings/enums/profile_items.dart';
import 'package:basketball/features/settings/enums/profile_items_extension.dart';
import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:basketball/features/settings/widgets/leading_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GetBuilder(
          init: profilePageController,
          builder: (_) {
            return ListTile(
              onTap: () {
                ProfileItems.values[index].performAction(context,
                    nameController, statusController, profilePageController);
              },
              leading: LeadingIcon(index: index),
              title: Text(ProfileItems.values[index].title,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: ProfileItems.values[index].title == 'Name'
                  ? Text(profilePageController.name)
                  : ProfileItems.values[index].title == 'Status'
                      ? Text(profilePageController.status)
                      : null,
              trailing: const Icon(
                Icons.edit_rounded,
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        indent: 48.5,
        endIndent: 48.5,
      ),
      itemCount: ProfileItems.values.length,
    );
  }
}
