import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/consts.dart';
import 'package:basketball/features/settings/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: kGrey24,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: kOrange,
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: IconButton(
                icon: SvgPicture.asset('assets/icons/default/edit.svg'),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                  onPressed: () async {
                                    context.router.pop();
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? pickedImage = await picker
                                        .pickImage(source: ImageSource.camera);
                                    if (pickedImage != null) {
                                      profilePageController
                                          .changeImage(File(pickedImage.path));
                                      context.router.pop();
                                    }
                                  },
                                  child: const Text('Camera')),
                              CupertinoActionSheetAction(
                                  onPressed: () async {
                                    context.router.pop();

                                    final ImagePicker picker = ImagePicker();
                                    final XFile? pickedImage = await picker
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickedImage != null) {
                                      profilePageController
                                          .changeImage(File(pickedImage.path));
                                    }
                                  },
                                  child: const Text('Library'))
                            ],
                            cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  context.router.pop();
                                },
                                child: const Text('Cancel')),
                          ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
