import 'package:news_app/model/article_model.dart';
import 'package:dio/dio.dart';
import 'package:news_app/utils/api_key.dart';
import 'package:news_app/utils/constants.dart';

class ApiService {
   Future<List<ArticleModel>> fetchNews() async {
    List<ArticleModel> data = [];
    try {
      final dio = Dio();
      final response = await dio
          .get('$baseUrl/top-headlines?country=$country&apiKey=$newsAPIKey');
      if (response.statusCode != 200) {
  
      }
      Map<String, dynamic> json = response.data;

      List<dynamic> res = json['articles'];
      data = res.map((e) => ArticleModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
