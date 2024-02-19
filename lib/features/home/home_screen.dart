import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:convert';
import 'package:intl/intl.dart';

import '../../api/models/given_match.dart';
import '../../api/providers/matches_provider.dart';
import '../../consts.dart';
import '../shared/loading_indicator.dart';
import 'match_details/misc/date_picker_function.dart';
import 'widgets/match_card.dart';

late StateProvider<String> dateProvider;

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
    dateProvider = StateProvider<String>((ref) => formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Main',
        ),
        actions: [
          TextButton(
            onPressed: () => callDatePicker(context, ref),
            child: Row(
              children: [
                const Icon(Icons.calendar_month_rounded, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                    DateFormat('dd.MM.yyyy')
                        .format(DateTime.parse(ref.watch(dateProvider))),
                    style: TextStyle(fontSize: 10.sp, color: kBlue)),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          final matchesData = ref.watch(matchesProvider);
          return matchesData.when(
            data: (matches) {
              if (matches.contains('error')) {
                return Center(
                    child: Text('No matches for selected day',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600)));
              } else {
                final jsonData = jsonDecode(matches);
                List matchList = jsonData['body'].values.toList();
                matchList.sort((a, b) {
                  final matchA = GivenMatch.fromJson(a);
                  final matchB = GivenMatch.fromJson(b);
                  return double.tryParse(matchA.gameTime)!
                      .toInt()
                      .compareTo(double.tryParse(matchB.gameTime)!.toInt());
                });

                return ListView.builder(
                  itemCount: matchList.length,
                  itemBuilder: (context, index) {
                    final matchData = matchList[index];
                    return Column(
                      children: [
                        MatchCard(matchData: matchData),
                      ],
                    );
                  },
                );
              }
            },
            loading: () => const LoadingIndicator(isCentered: true),
            error: (error, stackTrace) => ErrorTextWidget(error: error),
          );
        }),
      ),
    );
  }
}
