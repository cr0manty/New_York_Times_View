import 'package:flutter/material.dart';
import 'package:ny_times/models/article.dart';
import 'package:ny_times/utils/image_view.dart';
import 'package:ny_times/view/article_detail_view/detail_view.dart';

class ArticleListElement extends StatelessWidget {
  final Article article;

  ArticleListElement({
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailView(
              article: article,
            ),
          ),
        );
      },
      child: Container(
        height: 175,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 150,
              child: ImageView(article?.previewImage),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    article.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    article.abstract ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.8)
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      article.publishedAt,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
