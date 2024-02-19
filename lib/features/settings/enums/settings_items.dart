import 'package:flutter/material.dart';

enum SettingsItems {
  privacyPolicy('Privacy Policy', Icons.shield_rounded),
  termsOfUse('Terms of Use', Icons.list_alt_rounded),
  notification('Notification', Icons.notifications_rounded),
  shareApp('Share App', Icons.ios_share_rounded);

  final String title;
  final IconData iconData;

  const SettingsItems(this.title, this.iconData);
}
