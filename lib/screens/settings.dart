import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

var image = Image.asset(
  'assets/icons/settings/photo.png',
  width: 88,
  height: 88,
  fit: BoxFit.cover,
);
var newImage;

enum Items {
  privacyPolicy('Privacy Policy'),
  termsOfUse('Terms of Use'),
  notification('Notification'),
  shareApp('Share App');

  final String title;

  const Items(this.title);
}

extension ItemsExtension on Items {
  void performAction(BuildContext context) {
    switch (this) {
      case Items.privacyPolicy:
        context.router.push(const PrivacyPolicyRoute());
        break;
      case Items.termsOfUse:
        context.router.push(const TermsOfUseRoute());
        break;
      case Items.notification:
        AppSettings.openAppSettings();
        break;
      case Items.shareApp:
        Share.share('Check out this awesome basketball app!');
        break;
    }
  }
}

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController nameController = TextEditingController(text: 'Name');
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: isEditing
                      ? TextButton(
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          onPressed: () {
                            setState(() {
                              newImage = null;
                              isEditing = !isEditing;
                            });
                          },
                        )
                      : Container()),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: newImage == null
                          ? image
                          : Image.file(
                              newImage,
                              width: 88,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                    ),
                    if (isEditing)
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? pickedImage =
                                                await picker.pickImage(
                                                    source: ImageSource.camera);
                                            if (pickedImage != null) {
                                              setState(() {
                                                newImage =
                                                    File(pickedImage.path);
                                                context.router.pop();
                                              });
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(Icons.photo_camera),
                                              SizedBox(width: 10),
                                              Text('Camera'),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        TextButton(
                                          onPressed: () async {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? pickedImage =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (pickedImage != null) {
                                              setState(() {
                                                newImage =
                                                    File(pickedImage.path);
                                                context.router.pop();
                                              });
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(Icons.photo),
                                              SizedBox(width: 10),
                                              Text('Photos'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Change',
                            style: TextStyle(
                              fontFamily: 'SrbijaSans',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Text(
                    isEditing ? 'Done' : 'Edit',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newImage != null) {
                        image = Image.file(
                          newImage,
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                        );
                      }
                      isEditing = !isEditing;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: isEditing
                    ? TextField(
                        autofocus: true,
                        textAlign: TextAlign.center,
                        controller: nameController,
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()))
                    : Text(
                        nameController.text,
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Items.values[index].performAction(context);
                  },
                  leading: SvgPicture.asset(
                      'assets/icons/settings/${Items.values[index].title.replaceAll(' ', '')}.svg'),
                  title: Text(
                    Items.values[index].title,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(82, 41, 17, 1),
                        fontFamily: 'SrbijaSans'),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(82, 41, 17, 1),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromRGBO(82, 41, 17, 0.5),
                indent: 48.5,
                endIndent: 48.5,
              ),
              itemCount: Items.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
