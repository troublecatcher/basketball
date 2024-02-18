import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:basketball/main.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

late PageController _pageController;
late TextEditingController _nameController;
late TextEditingController _statusController;
late ProfilePageController _profilePageController;

var newImage;

enum ProfileItems {
  changeName('Name', Icons.person),
  changeStatus('Status', Icons.comment_rounded);

  final String title;
  final IconData iconData;

  const ProfileItems(this.title, this.iconData);
}

extension ProfileExtension on ProfileItems {
  void performAction(BuildContext context) {
    switch (this) {
      case ProfileItems.changeName:
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Profile Name'),
                  content: CupertinoTextField(
                    controller: _nameController,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => context.router.pop(),
                      child: const Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Save'),
                      onPressed: () {
                        _profilePageController.changeName(_nameController.text);
                        context.router.pop();
                      },
                    ),
                  ],
                ));
        break;
      case ProfileItems.changeStatus:
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Profile Status'),
                  content: CupertinoTextField(
                    controller: _statusController,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => context.router.pop(),
                      child: const Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Save'),
                      onPressed: () {
                        _profilePageController
                            .changeStatus(_statusController.text);
                        context.router.pop();
                      },
                    ),
                  ],
                ));
        break;
    }
  }
}

enum SettingsItems {
  privacyPolicy('Privacy Policy', Icons.shield_rounded),
  termsOfUse('Terms of Use', Icons.list_alt_rounded),
  notification('Notification', Icons.notifications_rounded),
  shareApp('Share App', Icons.ios_share_rounded);

  final String title;
  final IconData iconData;

  const SettingsItems(this.title, this.iconData);
}

extension SettingsExtension on SettingsItems {
  void performAction(BuildContext context) {
    switch (this) {
      case SettingsItems.privacyPolicy:
        context.router.push(const PrivacyPolicyRoute());
        break;
      case SettingsItems.termsOfUse:
        context.router.push(const TermsOfUseRoute());
        break;
      case SettingsItems.notification:
        AppSettings.openAppSettings();
        break;
      case SettingsItems.shareApp:
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
  int pageIndex = 0;
  Map<int, Widget> pages = <int, Widget>{
    0: const Padding(
        padding: EdgeInsets.all(10),
        child:
            Text('My Profile', style: TextStyle(fontWeight: FontWeight.w600))),
    1: const Padding(
        padding: EdgeInsets.all(10),
        child: Text('Settings', style: TextStyle(fontWeight: FontWeight.w600))),
  };

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    if (locator<SharedPreferences>().getString('name') == null) {
      locator<SharedPreferences>().setString('name', 'Brian Imanuel');
      locator<SharedPreferences>().setString('status', '#YNWK till the end 🔥');
    }
    _nameController = TextEditingController(
        text: locator<SharedPreferences>().getString('name'));
    _statusController = TextEditingController(
        text: locator<SharedPreferences>().getString('status'));
    _profilePageController = ProfilePageController();
  }

  @override
  Widget build(BuildContext context) {
    var imageSide = MediaQuery.of(context).size.height / 5;

    var image = Image.asset(
      'assets/icons/settings/photo.png',
      width: imageSide,
      height: imageSide,
      fit: BoxFit.cover,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: imageSide,
                  height: imageSide,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: newImage == null
                            ? image
                            : Image.file(
                                newImage,
                                width: imageSide,
                                height: imageSide,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(24, 24, 41, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(237, 107, 78, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assets/icons/default/edit.svg'),
                                  color: Colors.white,
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoActionSheet(
                                              actions: [
                                                CupertinoActionSheetAction(
                                                    onPressed: () async {
                                                      context.router.pop();
                                                      final ImagePicker picker =
                                                          ImagePicker();
                                                      final XFile? pickedImage =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      if (pickedImage != null) {
                                                        setState(() {
                                                          newImage = File(
                                                              pickedImage.path);
                                                          context.router.pop();
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        const Text('Camera')),
                                                CupertinoActionSheetAction(
                                                    onPressed: () async {
                                                      context.router.pop();

                                                      final ImagePicker picker =
                                                          ImagePicker();
                                                      final XFile? pickedImage =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      if (pickedImage != null) {
                                                        setState(() {
                                                          newImage = File(
                                                              pickedImage.path);
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        const Text('Library'))
                                              ],
                                              cancelButton:
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        context.router.pop();
                                                      },
                                                      child:
                                                          const Text('Cancel')),
                                            ));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: GetBuilder(
                    init: _profilePageController,
                    builder: (_) {
                      return Text(
                        _profilePageController.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: GetBuilder(
                    init: _profilePageController,
                    builder: (_) {
                      return Text(
                        _profilePageController.status,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  CupertinoSlidingSegmentedControl(
                      backgroundColor: const Color.fromRGBO(24, 24, 41, 1),
                      thumbColor: const Color.fromRGBO(237, 107, 78, 1),
                      groupValue: pageIndex,
                      children: pages,
                      onValueChanged: (value) {
                        setState(() {
                          pageIndex = value!;
                          _pageController.animateToPage(value,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        });
                      }),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GetBuilder(
                              init: _profilePageController,
                              builder: (_) {
                                return ListTile(
                                  onTap: () {
                                    ProfileItems.values[index]
                                        .performAction(context);
                                  },
                                  leading: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(34, 34, 50, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                      child: Icon(
                                          ProfileItems.values[index].iconData,
                                          color: Colors.white)),
                                  title: Text(ProfileItems.values[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  subtitle: ProfileItems.values[index].title ==
                                          'Name'
                                      ? Text(_profilePageController.name)
                                      : ProfileItems.values[index].title ==
                                              'Status'
                                          ? Text(_profilePageController.status)
                                          : null,
                                  trailing: const Icon(
                                    Icons.edit_rounded,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Colors.grey,
                            indent: 48.5,
                            endIndent: 48.5,
                          ),
                          itemCount: ProfileItems.values.length,
                        ),
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                SettingsItems.values[index]
                                    .performAction(context);
                              },
                              leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(34, 34, 50, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Icon(
                                      SettingsItems.values[index].iconData,
                                      color: Colors.white)),
                              title: Text(SettingsItems.values[index].title,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Colors.grey,
                            indent: 48.5,
                            endIndent: 48.5,
                          ),
                          itemCount: SettingsItems.values.length,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePageController extends GetxController {
  var name = _nameController.text;
  var status = _statusController.text;
  changeName(String newName) async {
    name = newName;
    await locator<SharedPreferences>().setString('name', _nameController.text);
    update();
  }

  changeStatus(String newStatus) async {
    status = newStatus;
    await locator<SharedPreferences>().setString('name', _nameController.text);
    update();
  }
}
