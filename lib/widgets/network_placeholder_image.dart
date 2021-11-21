import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const NetworkPlaceholderImage(
      {Key? key, required this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      memCacheHeight: 200,
      placeholder: (context, url) => placeholder(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: themeColor,
      ),
    );
  }

  Widget placeholder({double width = 20.0, double height = 20.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoActivityIndicator(radius: min(10.0, width / 3)),
    );
  }
}
