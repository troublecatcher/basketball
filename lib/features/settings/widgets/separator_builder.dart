import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeparatorBuilder extends StatelessWidget {
  const SeparatorBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      indent: 48.5,
      endIndent: 48.5,
    );
  }
}
