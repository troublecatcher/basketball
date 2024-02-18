import 'package:basketball/main.dart';
import 'package:basketball/screens/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final newsItemProvider = FutureProvider.autoDispose((ref) async {
  var url = Uri.parse(ref.watch(newsItemUrlProvider));
  var params = {'recentNews': 'true'};

  final response =
      await http.get(url.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
