import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class WeixinArticleWidget extends StatefulWidget {
  final OfficialAccountModel account;
  const WeixinArticleWidget({Key? key, required this.account})
      : super(key: key);

  @override
  _WeixinArticleWidgetState createState() => _WeixinArticleWidgetState(account);
}

class _WeixinArticleWidgetState extends State<WeixinArticleWidget>
    with AutomaticKeepAliveClientMixin {
  final OfficialAccountModel account;
  List<HomeArticleModel> articles = [];
  int pageIndex = 0;

  _WeixinArticleWidgetState(this.account);

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
                Text(
                  article.title!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("公众号·${article.articleAuthor}"),
                      ),
                      Text(article.niceDate ?? article.niceShareDate ?? "")
                    ],
                  ),
                )
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

  requestWeixinOfficialAccountArticles() {
    Api.getWeixinOfficialAccountArticles(
            account.id?.toInt() ?? 0, pageIndex, pageSize)
        .then((value) {
      setState(() {
        articles = value.datas ?? [];
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
