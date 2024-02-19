import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../features/home/match_details/match_details_screen.dart';
import '../connection.dart';

final boxscoreProvider = FutureProvider.autoDispose((ref) async {
  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBABoxScore');
  var params = {
    'gameID': ref.watch(gameIDProvider),
    // 'gameID': '20240215_POR@MIN',
    'fantasyPoints': 'true',
    'pts': '1',
    'stl': '3',
    'blk': '3',
    'reb': '1.25',
    'ast': '1.5',
    'TOV': '-1',
    'mins': '0',
    'doubleDouble': '0',
    'tripleDouble': '0',
    'quadDouble': '0'
  };

  final response =
      await http.get(url.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
