import 'package:flutter/material.dart';
import 'package:ny_times/view/article_list_view/list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArticleListView(),
    );
  }
}
