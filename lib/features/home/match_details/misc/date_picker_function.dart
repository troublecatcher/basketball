import 'package:basketball/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../consts.dart';

Future<void> callDatePicker(BuildContext context, WidgetRef ref) async {
  final DateTime? pickedDate = await showDatePicker(
    barrierColor: kGrey24,
    context: context,
    initialDate: DateTime.parse(ref.watch(dateProvider)),
    firstDate: DateTime(0),
    lastDate: DateTime.now(),
  );
  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyyMMdd').format(pickedDate);
    ref.read(dateProvider.notifier).state = formattedDate;
  }
}
