import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final teamsProvider = FutureProvider.autoDispose((ref) async {
  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBATeams');
  var headers = {
    'X-RapidAPI-Key': 'c7354da376msh852a94ceb7134bfp1de1f1jsn60233212053c',
    'X-RapidAPI-Host': 'tank01-fantasy-stats.p.rapidapi.com'
  };
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load teams');
  }
});
