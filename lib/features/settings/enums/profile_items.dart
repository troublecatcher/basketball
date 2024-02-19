import 'package:flutter/material.dart';

enum ProfileItems {
  changeName('Name', Icons.person),
  changeStatus('Status', Icons.comment_rounded);

  final String title;
  final IconData iconData;

  const ProfileItems(this.title, this.iconData);
}
