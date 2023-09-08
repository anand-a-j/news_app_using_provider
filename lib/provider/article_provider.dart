import 'package:flutter/material.dart';
import 'package:news_app/controller/api_service.dart';
import 'package:news_app/model/article_model.dart';

class ArticleProvider extends ChangeNotifier {
  final _service = ApiService();
  List<ArticleModel> _articles = [];
  List<ArticleModel> get articles => _articles;
  bool isLoading = false;

  Future<void> fetchNewsArticles() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.fetchNews();
    _articles = response;

    isLoading = false;
    notifyListeners();
  }
}
