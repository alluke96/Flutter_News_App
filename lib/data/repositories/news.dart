import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/models/news.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  Future<List<NewsModel>> fetchNews() async {
    const String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';
    final String apiKey = dotenv.get('API_KEY');
    final response = await http.get(Uri.parse(baseUrl + apiKey));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['articles'];
      return data.map((article) => NewsModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
