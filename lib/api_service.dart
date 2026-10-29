import 'dart:convert';

import 'pages/article_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Article>> fetchArticles() async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2026-09-29&sortBy=publishedAt&apiKey=e76fb95ddfbd4975af643b21bb7687f6',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengambil berita: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final articles = data['articles'] as List;

    return articles
        .map((item) => Article.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
