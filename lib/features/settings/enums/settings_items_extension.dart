import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/settings/enums/settings_items.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';

extension SettingsExtension on SettingsItems {
  void performAction(BuildContext context) {
    switch (this) {
      case SettingsItems.privacyPolicy:
        context.router.push(const PrivacyPolicyRoute());
        break;
      case SettingsItems.termsOfUse:
        context.router.push(const TermsOfUseRoute());
        break;
      case SettingsItems.notification:
        AppSettings.openAppSettings();
        break;
      default:
    }
  }
}
