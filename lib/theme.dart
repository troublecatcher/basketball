import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'consts.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
    iconTheme: IconThemeData(color: kWhite),
    listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(color: Colors.white),
        iconColor: kWhite),
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: kGrey24,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 16.sp)),
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: kGrey24,
    textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        fontFamily: 'ssp'));
