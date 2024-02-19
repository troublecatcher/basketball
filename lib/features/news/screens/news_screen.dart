import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/features/news/news_card.dart';
import 'package:basketball/features/shared/error_text_widget.dart';
import 'package:basketball/features/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/models/news.dart';
import '../../../api/providers/news_provider.dart';

late StateProvider<String> newsItemUrlProvider;

@RoutePage()
class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsRef = ref.watch(newsProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Explore',
        ),
      ),
      body: SafeArea(
        child: newsRef.when(
          data: (news) {
            final newsJson = jsonDecode(news);
            List newsList = newsJson['articles']
                .map((news) => News.fromJson(news))
                .toList();
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsCard(news: newsList[index], index: index);
              },
            );
          },
          loading: () => const LoadingIndicator(isCentered: true),
          error: (error, stackTrace) => ErrorTextWidget(error: error),
        ),
      ),
    );
  }
}
