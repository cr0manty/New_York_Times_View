import 'dart:async';
import 'dart:convert';

import 'package:ny_times/models/article.dart';
import 'package:ny_times/network/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleListModelView {
  final StreamController<List> _onArticleListChanged =
      StreamController<List>.broadcast();

  Stream<List> get onArticleListChanged =>
      _onArticleListChanged.stream;

  ArticleListModelView() {
    _getLocalArticles();
    _getNetworkArticles();
  }

  void _getLocalArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List articles = (prefs.getStringList('Articles') ?? []).map((dynamic i) {
      Map<String, dynamic> jsonData = json.decode(i);
      return Article.fromJson(jsonData);
    }).toList();
    _onArticleListChanged.add(articles);
  }

  void _getNetworkArticles() async {
    final result = await ApiClient.instance.getArticles();
    if (result.isSuccess) {
      List articles = (result.data['results'] ?? [])
          .map((dynamic i) => Article.fromJson(i as Map<String, dynamic>))
          .toList();
      _onArticleListChanged.add(articles);
      _saveArticles(articles);
    }
  }

  void _saveArticles(List articles) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> values = articles.map((dynamic i) => i.toString()).toList();
    prefs.setStringList('Articles', values);
  }

  void dispose() {
    _onArticleListChanged?.close();
  }
}
