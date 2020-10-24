import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  final BoxFit fit;

  ImageView(this.url, {this.fit});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(color: Colors.grey);
    }

    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover),
        ),
      ),
      errorWidget: (context, url, error) => Container(color: Colors.grey),
      placeholder: (context, url) => Container(
        color: Colors.grey,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
