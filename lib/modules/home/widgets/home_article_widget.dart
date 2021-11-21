import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/models/home_article_model.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';
import 'package:wanandroid_flutter/widgets/network_placeholder_image.dart';

class HomeArticleWidget extends StatefulWidget {
  final HomeArticleModel article;
  const HomeArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  _HomeArticleWidgetState createState() => _HomeArticleWidgetState(article);
}

class _HomeArticleWidgetState extends State<HomeArticleWidget> {
  final HomeArticleModel article;
  final double padding = 8.0;

  _HomeArticleWidgetState(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(padding, padding / 2, padding, padding / 2),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    color: backgroundColor,
                    child: NetworkPlaceholderImage(url: article.avatarUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Text(article.articleAuthor),
                  ),
                ),
                Text(article.niceDate ?? article.niceShareDate ?? ""),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: Text(
                article.title ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${article.superChapterName ?? ""}·${article.chapterName ?? ""}",
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: greyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Icon(
                  Icons.favorite_border,
                  color: greyColor,
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WebViewPage(
              url: article.link ?? "",
              title: article.title ?? "",
            ),
          ),
        );
      },
    );
  }
}
