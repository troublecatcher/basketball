import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../api/models/news.dart';

@RoutePage()
class NewsDetailsScreen extends StatefulWidget {
  final News news;
  const NewsDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(82, 41, 17, 1),
        centerTitle: true,
        title: Text(
          'News Details',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'newsImage_${widget.news.title}',
              child: Image.network(
                widget.news.imageLink,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.news.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 8),
                  Text(
                    widget.news.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
