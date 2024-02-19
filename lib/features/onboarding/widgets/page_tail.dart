import 'package:flutter/material.dart';

class Tail extends StatelessWidget {
  final List<Widget> content;
  const Tail({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...content,
          ],
        ),
      ),
    );
  }
}
