import 'package:basketball/api/connection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final newsProvider = FutureProvider.autoDispose((ref) async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?q=basketball&language=en&apiKey=$newsKey');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load matches');
  }
});
