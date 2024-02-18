import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/news.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../api/models/news.dart';
import '../api/models/news_details.dart';

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
          loading: () => const Center(child: CupertinoActivityIndicator()),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}

class NewsCard extends ConsumerWidget {
  final int index;
  final News news;

  const NewsCard({Key? key, required this.news, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          context.router.push(NewsDetailsRoute(news: news, index: index)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'news$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: news.urlToImage == null
                    ? Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        news.urlToImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/logo.png',
                              width: 100, height: 100);
                        },
                      ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(news.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    DateFormat("dd MMM yyyy, HH:mm")
                        .format(DateTime.parse(news.publishedAt).toLocal())
                        .toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
