import 'package:basketball/consts.dart';
import 'package:basketball/features/settings/enums/profile_items.dart';
import 'package:flutter/cupertino.dart';

class LeadingIcon extends StatelessWidget {
  final int index;

  const LeadingIcon({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kGrey34,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Icon(ProfileItems.values[index].iconData));
  }
}
