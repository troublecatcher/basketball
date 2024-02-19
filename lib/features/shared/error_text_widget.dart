import 'package:flutter/cupertino.dart';

class ErrorTextWidget extends StatelessWidget {
  final Object error;

  const ErrorTextWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Error: $error');
  }
}
