import 'package:auto_route/auto_route.dart';
import 'package:basketball/api/models/news.dart';
import 'package:basketball/screens/match_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewsDetailsScreen extends StatefulWidget {
  final News news;
  final int index;
  const NewsDetailsScreen({Key? key, required this.news, required this.index})
      : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'news${widget.index}',
              child: widget.news.urlToImage == null
                  ? Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.news.urlToImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/logo.png',
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.news.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.sp)),
                  const SizedBox(height: 20),
                  Text(widget.news.description ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    widget.news.content,
                  ),
                  const SizedBox(height: 20),
                  widget.news.author == null
                      ? const SizedBox.shrink()
                      : InfoWidget(title: 'Author', child: widget.news.author!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
