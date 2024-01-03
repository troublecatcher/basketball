import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final matchesProvider = FutureProvider.autoDispose((ref) async {
  var currentDate = DateTime.now();
  var formattedDate =
      '${currentDate.year}${currentDate.month.toString().padLeft(2, '0')}${currentDate.day.toString().padLeft(2, '0')}';

  var url =
      Uri.parse('https://tank01-fantasy-stats.p.rapidapi.com/getNBAScoresOnly');
  var params = {'gameDate': formattedDate};
  var headers = {
    'X-RapidAPI-Key': 'c7354da376msh852a94ceb7134bfp1de1f1jsn60233212053c',
    'X-RapidAPI-Host': 'tank01-fantasy-stats.p.rapidapi.com'
  };

  final response =
      await http.get(url.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
