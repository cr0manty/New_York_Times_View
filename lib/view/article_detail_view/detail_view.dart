import 'package:flutter/material.dart';
import 'package:ny_times/models/article.dart';

import 'detail_model_view.dart';

class ArticleDetailView extends StatefulWidget {
  final Article article;

  ArticleDetailView({
    @required this.article,
  });

  @override
  _ArticleDetailViewState createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  final ArticleDetailModelView _model = ArticleDetailModelView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
