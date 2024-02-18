import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../screens/match_details.dart';

final playersProvider = FutureProvider.autoDispose((ref) async {
  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBAPlayerList');

  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
