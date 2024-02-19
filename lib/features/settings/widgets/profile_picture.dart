import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.image,
    required this.imageSide,
  });

  final Image image;
  final double imageSide;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: profilePageController,
      initState: (_) {},
      builder: (_) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: profilePageController.image == null
              ? image
              : Image.file(
                  profilePageController.image!,
                  width: imageSide,
                  height: imageSide,
                  fit: BoxFit.cover,
                ),
        );
      },
    );
  }
}
