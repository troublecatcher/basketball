import 'package:basketball/consts.dart';
import 'package:basketball/features/settings/enums/settings_items.dart';
import 'package:basketball/features/settings/enums/settings_items_extension.dart';
import 'package:basketball/features/settings/widgets/separator_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Builder(builder: (ctx) {
          return ListTile(
            onTap: () {
              if (SettingsItems.values[index] == SettingsItems.shareApp) {
                final box = ctx.findRenderObject() as RenderBox?;
                Share.share('Check out this awesome basketball app!',
                    sharePositionOrigin:
                        box!.localToGlobal(Offset.zero) & box.size);
              }
              SettingsItems.values[index].performAction(context);
            },
            leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kGrey34,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Icon(SettingsItems.values[index].iconData,
                    color: Colors.white)),
            title: Text(SettingsItems.values[index].title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          );
        });
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SeparatorBuilder(),
      itemCount: SettingsItems.values.length,
    );
  }
}
