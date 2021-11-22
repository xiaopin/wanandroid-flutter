import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';
import 'package:wanandroid_flutter/widgets/network_placeholder_image.dart';

class StructureArticleWidget extends StatefulWidget {
  final int cid;
  const StructureArticleWidget({Key? key, required this.cid}) : super(key: key);

  @override
  _StructureArticleWidgetState createState() =>
      _StructureArticleWidgetState(cid);
}

class _StructureArticleWidgetState extends State<StructureArticleWidget>
    with AutomaticKeepAliveClientMixin {
  final int cid;
  List<HomeArticleModel> articles = [];
  int pageIndex = 0;

  _StructureArticleWidgetState(this.cid);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestWeixinOfficialAccountArticles();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        HomeArticleModel article = articles[index];
        return InkWell(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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
                    Text(
                      article.niceDate ?? article.niceShareDate ?? "",
                      style: TextStyle(color: greyColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 5.0, 5.0),
                        child: Text(
                          article.title ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     Text(
            //       article.title!,
            //       style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 14.0,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.only(top: 5.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Expanded(
            //             child: Text(article.articleAuthor),
            //           ),
            //           Text(article.niceDate ?? article.niceShareDate ?? "")
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (BuildContext context) => WebViewPage(
                url: article.link ?? "",
                title: article.title,
              ),
            );
            Navigator.push(context, route);
          },
        );
      },
      itemCount: articles.length,
    );
  }

  requestWeixinOfficialAccountArticles() {
    Api.getStructureArticles(cid, pageIndex, pageSize).then((value) {
      setState(() {
        articles = value.datas ?? [];
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
