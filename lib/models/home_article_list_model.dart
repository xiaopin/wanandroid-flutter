import 'package:json_annotation/json_annotation.dart';

import 'home_article_model.dart';

part 'home_article_list_model.g.dart';

@JsonSerializable()
class HomeArticleListModel {
  HomeArticleListModel();

  num? curPage;
  List<HomeArticleModel>? datas;
  num? offset;
  bool? over;
  num? pageCount;
  num? size;
  num? total;

  factory HomeArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleListModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeArticleListModelToJson(this);
}
