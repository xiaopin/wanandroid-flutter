import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/home/widgets/home_article_widget.dart';
import 'package:wanandroid_flutter/modules/home/widgets/home_banner_widget.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 0;
  List<HomeBannerModel> banners = []; // 轮播数据
  List<HomeArticleModel> topArticles = []; // 置顶文章数据

  @override
  void initState() {
    super.initState();
    requestData(pageIndex);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bannerCount = min(banners.length, 1);
    var articleCount = topArticles.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter WanAndroid"),
        backgroundColor: themeColor,
      ),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // 轮播
          // if (banners.isNotEmpty && index == 0) {
          if (index < bannerCount) {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: HomeBannerWidget(data: banners),
            );
          }
          index -= bannerCount;
          // 文章列表
          var article = topArticles[index];
          return HomeArticleWidget(article: article);
        },
        itemCount: bannerCount + articleCount,
      ),
    );
  }

  requestData(int pageIndex) {
    List<Future> tasks = [
      Api.getHomeArticles(pageIndex, pageSize),
    ];
    if (pageIndex == 0) {
      tasks.addAll([
        Api.getHomeTopArticles(),
        Api.getHomeBanners(),
      ]);
    }
    Future.wait(tasks).then((value) {
      List<HomeArticleModel> articles = [];
      if (pageIndex == 0) {
        // 置顶文章数据
        List<HomeArticleModel> topArticles = value[1];
        articles.addAll(topArticles);
        // 首页文章数据
        HomeArticleListModel model = value[0];
        if (model.datas != null) {
          articles.addAll(model.datas!);
        }
      }
      setState(() {
        topArticles = articles;
        if (pageIndex == 0) {
          banners = value[2];
        }
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
