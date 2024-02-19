import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../features/home/home_screen.dart';
import '../connection.dart';

final matchesProvider = FutureProvider.autoDispose((ref) async {
  // var currentDate = DateTime.now();
  // var formattedDate =
  //     '${currentDate.year}${currentDate.month.toString().padLeft(2, '0')}${currentDate.day.toString().padLeft(2, '0')}';

  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBAScoresOnly');
  var params = {
    // 'gameDate': '20240215',
    // 'gameDate': formattedDate,
    'gameDate': ref.watch(dateProvider),
  };

  final response =
      await http.get(url.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
