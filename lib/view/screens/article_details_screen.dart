import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel newsArticles;
  const ArticleDetailsScreen({super.key, required this.newsArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(newsArticles.urlToImage ??
                        "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9hZGluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
            Text(
              newsArticles.title ?? "Loading...",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
            SizedBox(
              height: 16,
              width: double.infinity,
              child: Text(
                "${newsArticles.source!.name ?? ''} • ${GetTimeAgo.parse(DateTime.parse(newsArticles.publishedAt!.toString()))}",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            SizedBox(
              width: double.infinity,
              child: Text(
                newsArticles.description ?? "",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            InkWell(
              onTap: () {
                launchInBrowser(Uri.parse(newsArticles.url!));
              },
              child: Chip(
                label: Text(newsArticles.url!),
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception("Could not lunch url");
    }
  }
}
