import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/settings/enums/profile_items.dart';
import 'package:basketball/features/settings/enums/profile_items_extension.dart';
import 'package:basketball/features/settings/enums/settings_items.dart';
import 'package:basketball/features/settings/enums/settings_items_extension.dart';
import 'package:basketball/features/settings/pages/profile_page.dart';
import 'package:basketball/features/settings/pages/settings_page.dart';
import 'package:basketball/features/settings/widgets/edit_button.dart';
import 'package:basketball/features/settings/widgets/leading_icon.dart';
import 'package:basketball/features/settings/widgets/name_field.dart';
import 'package:basketball/features/settings/widgets/profile_picture.dart';
import 'package:basketball/features/settings/widgets/separator_builder.dart';
import 'package:basketball/features/settings/widgets/status_field.dart';
import 'package:basketball/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../consts.dart';

late PageController pageController;
late TextEditingController nameController;
late TextEditingController statusController;
late ProfilePageController profilePageController;

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
    pageController = PageController(initialPage: 0);
    nameController = TextEditingController(text: 'Brian Imanuel');
    statusController = TextEditingController(text: '#YNWK till the end 🔥');
    profilePageController = ProfilePageController();
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
                      ProfilePicture(image: image, imageSide: imageSide),
                      const EditButton(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NameField(),
                SizedBox(height: 5),
                StatusField(),
                SizedBox(height: 10),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  CupertinoSlidingSegmentedControl(
                      backgroundColor: kGrey24,
                      thumbColor: kOrange,
                      groupValue: pageIndex,
                      children: pages,
                      onValueChanged: (value) {
                        setState(() {
                          pageIndex = value!;
                          pageController.animateToPage(value,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        });
                      }),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      children: [
                        ProfilePage(),
                        SettingsPage(),
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
  var name = nameController.text;
  var status = statusController.text;
  File? image;

  changeName(String newName) {
    name = newName;
    update();
  }

  changeStatus(String newStatus) async {
    status = newStatus;
    update();
  }

  changeImage(File newImage) {
    image = newImage;
    update();
  }
}
