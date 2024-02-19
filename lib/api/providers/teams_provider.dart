import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../connection.dart';

final teamsProvider = FutureProvider.autoDispose((ref) async {
  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBATeams');
  var params = {
    'schedules': 'true',
    'rosters': 'true',
    'topPerformers': 'true',
    'teamStats': 'true',
    'statsToGet': 'averages'
  };
  final response =
      await http.get(url.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load teams');
  }
});
