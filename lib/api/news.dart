import 'package:basketball/main.dart' hide headers;
import 'package:basketball/screens/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final newsProvider = FutureProvider.autoDispose((ref) async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?q=basketball&language=en&apiKey=18eda10535a840b89c9e79a4ff7d9b90');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
