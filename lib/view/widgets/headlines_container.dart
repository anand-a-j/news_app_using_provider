import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/view/screens/article_details_screen.dart';

class HeadlinesContainer extends StatelessWidget {
  final ArticleModel newsArticles;
  const HeadlinesContainer({
    super.key,
    required this.newsArticles,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ArticleDetailsScreen(newsArticles: newsArticles),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: MediaQuery.sizeOf(context).height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    newsArticles.urlToImage ??
                        "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9hZGluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Text(
                      newsArticles.title ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    child: Text(
                      "${newsArticles.source!.name} • ${GetTimeAgo.parse(DateTime.parse(newsArticles.publishedAt!.toString()))}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.004,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
