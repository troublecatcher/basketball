import 'package:basketball/api/models/player.dart';
import 'package:basketball/features/shared/error_image_widget.dart';
import 'package:flutter/material.dart';

class PlayerImage extends StatelessWidget {
  const PlayerImage({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            if (player.imgUrl == null)
              // ignore: prefer_const_constructors
              ErrorImageWidget(side: 200)
            else
              Image.network(
                player.imgUrl!,
                width: 200,
                height: 200,
                errorBuilder: (context, error, stackTrace) =>
                    const ErrorImageWidget(side: 200),
              ),
          ],
        ),
      ],
    );
  }
}
