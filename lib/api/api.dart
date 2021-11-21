import 'package:wanandroid_flutter/api/http.dart';
import 'package:wanandroid_flutter/models/index.dart';

/// 接口实现类
class Api {
  Api._();

  /// 获取首页文章列表
  static Future<HomeArticleListModel> getHomeArticles(
      int pageIndex, int pageSize) {
    return Http.get("/article/list/$pageIndex/json?page_size=$pageSize")
        .then((value) {
      Map map = value.data;
      var model = HomeArticleListModel.fromJson(map["data"]);
      return model;
    });
  }

  /// 获取首页置顶文章列表
  static Future<List<HomeArticleModel>> getHomeTopArticles() {
    return Http.get("/article/top/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<HomeArticleModel> ret = [];
      if (array is List) {
        ret = array
            .map<HomeArticleModel>((item) => HomeArticleModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取首页轮播数据
  static Future<List<HomeBannerModel>> getHomeBanners() {
    return Http.get("/banner/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<HomeBannerModel> ret = [];
      if (array is List) {
        for (var element in array) {
          var model = HomeBannerModel.fromJson(element);
          ret.add(model);
        }
      }
      return ret;
    });
  }

  /// 获取常用网站链接数据
  static Future<List<FriendUrlModel>> getFriendUrls() {
    return Http.get("/friend/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<FriendUrlModel> ret = [];
      if (array is List) {
        ret = array
            .map<FriendUrlModel>((item) => FriendUrlModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取体系数据
  static Future<List<StructureTreeModel>> getStructureTrees() {
    return Http.get("/tree/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<StructureTreeModel> ret = [];
      if (array is List) {
        ret = array
            .map<StructureTreeModel>(
                (item) => StructureTreeModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取导航数据
  static Future<List<NavigationTreeModel>> getNavigationTrees() {
    return Http.get("/navi/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<NavigationTreeModel> ret = [];
      if (array is List) {
        ret = array
            .map<NavigationTreeModel>(
                (item) => NavigationTreeModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取公众号列表
  static Future<List<OfficialAccountModel>> getWeixinOfficialAccounts() {
    return Http.get("/wxarticle/chapters/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<OfficialAccountModel> ret = [];
      if (array is List) {
        ret = array
            .map<OfficialAccountModel>(
                (item) => OfficialAccountModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取置顶公众号的文章列表
  static Future<HomeArticleListModel> getWeixinOfficialAccountArticles(
      int id, int pageIndex, int pageSize) {
    return Http.get("/wxarticle/list/$id/$pageIndex/json?page_size=$pageSize")
        .then((value) {
      Map map = value.data;
      var model = HomeArticleListModel.fromJson(map["data"]);
      return model;
    });
  }

  /// 获取项目分类列表数据
  static Future<List<ProjectCategoryModel>> getProjectCategories() {
    return Http.get("/project/tree/json").then((value) {
      Map map = value.data;
      List array = map["data"];
      List<ProjectCategoryModel> ret = [];
      if (array is List) {
        ret = array
            .map<ProjectCategoryModel>(
                (item) => ProjectCategoryModel.fromJson(item))
            .toList();
      }
      return ret;
    });
  }

  /// 获取项目列表
  static Future<HomeArticleListModel> getProjectArticles(
      int id, int pageIndex, int pageSize) {
    return Http.get("/project/list/$pageIndex/json?cid=$id&page_size=$pageSize")
        .then((value) {
      Map map = value.data;
      var model = HomeArticleListModel.fromJson(map["data"]);
      return model;
    });
  }
}
