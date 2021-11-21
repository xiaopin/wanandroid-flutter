import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';
import 'package:wanandroid_flutter/widgets/network_placeholder_image.dart';

class ProjectArticleWidget extends StatefulWidget {
  final ProjectCategoryModel category;
  const ProjectArticleWidget({Key? key, required this.category})
      : super(key: key);

  @override
  _ProjectArticleWidgetState createState() =>
      _ProjectArticleWidgetState(category);
}

class _ProjectArticleWidgetState extends State<ProjectArticleWidget>
    with AutomaticKeepAliveClientMixin {
  final ProjectCategoryModel category;
  List<HomeArticleModel> articles = [];
  int pageIndex = 0;

  _ProjectArticleWidgetState(this.category);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestProjectArticles();
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
                        // child: Image.network(
                        //   article.avatarUrl,
                        // ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 8.0, bottom: 5.0),
                            child: Text(
                              article.title!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            article.desc ?? "",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 151, 151, 151),
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                    NetworkPlaceholderImage(
                      url: article.envelopePic ?? "",
                      width: 50,
                      height: 88,
                      fit: BoxFit.cover,
                    ),
                    // Image.network(
                    //   article.envelopePic ?? "",
                    //   width: 50,
                    //   height: 88,
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
              ],
            ),
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

  requestProjectArticles() {
    Api.getProjectArticles(category.id?.toInt() ?? 0, pageIndex, pageSize)
        .then((value) {
      setState(() {
        articles = value.datas ?? [];
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
