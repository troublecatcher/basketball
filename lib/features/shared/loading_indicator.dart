import 'package:flutter/cupertino.dart';

import '../../consts.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isCentered;

  const LoadingIndicator({
    super.key,
    required this.isCentered,
  });

  @override
  Widget build(BuildContext context) {
    return isCentered
        ? Center(child: CupertinoActivityIndicator(color: kWhite))
        : CupertinoActivityIndicator(color: kWhite);
  }
}
