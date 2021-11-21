import 'package:json_annotation/json_annotation.dart';

import 'home_article_model.dart';

part 'navigation_tree_model.g.dart';

@JsonSerializable()
class NavigationTreeModel {
  NavigationTreeModel();

  List<HomeArticleModel>? articles;
  num? cid;
  String? name;

  factory NavigationTreeModel.fromJson(Map<String, dynamic> json) =>
      _$NavigationTreeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NavigationTreeModelToJson(this);
}
