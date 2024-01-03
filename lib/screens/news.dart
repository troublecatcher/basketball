import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/news.dart';
import 'package:basketball/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import '../api/models/news.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(82, 41, 17, 1),
        centerTitle: true,
        title: Text(
          'News',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NewsCard(news: newsList[index]),
            ],
          );
        },
      ),
    );
  }
}

class NewsCard extends ConsumerWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String formattedDate =
        "${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString()}";

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        height: 196,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(82, 41, 17, 0.1),
              offset: Offset(2, 4),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'newsImage_${news.title}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  news.imageLink,
                  width: 156,
                  height: 156,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 159,
                  height: 72,
                  child: Text(
                    news.title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    context.router.push(NewsDetailsRoute(news: news));
                  },
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 7, right: 13, bottom: 7, left: 13),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 117, 44, 1),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Text(
                            'Read',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
