import 'package:flutter/material.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/view/widgets/headlines_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ArticleProvider>(context, listen: false).fetchNewsArticles();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.articles.isEmpty) {
            return const Center(
              child: Text("Something Went Wrong..."),
            );
          }

          final articles = value.articles;
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return HeadlinesContainer(newsArticles: article);
              });
        },
      ),
    );
  }
}
