import 'package:flutter/cupertino.dart';

class ErrorImageWidget extends StatelessWidget {
  final double? side;
  final errorImageAssetPath = 'assets/logo.png';

  const ErrorImageWidget({super.key, this.side});

  @override
  Widget build(BuildContext context) {
    return side == null
        ? Image.asset(errorImageAssetPath)
        : Image.asset(errorImageAssetPath, width: side, height: side);
  }
}
