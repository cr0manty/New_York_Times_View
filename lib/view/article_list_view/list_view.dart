import 'package:flutter/material.dart';
import 'package:ny_times/models/article.dart';
import 'package:ny_times/view/article_list_view/list_model_view.dart';

import 'article_list_element.dart';

class ArticleListView extends StatefulWidget {
  @override
  _ArticleListViewState createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  final ArticleListModelView _model = ArticleListModelView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: StreamBuilder<List>(
          stream: _model.onArticleListChanged,
          initialData: [],
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (_, index) => ArticleListElement(
                article: snapshot.data[index],
              ),
              itemCount: snapshot.data.length,
            );
          }),
    );
  }

  @override
  void dispose() {
    _model?.dispose();
    super.dispose();
  }
}
