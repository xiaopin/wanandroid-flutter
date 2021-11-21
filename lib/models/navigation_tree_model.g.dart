// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationTreeModel _$NavigationTreeModelFromJson(Map<String, dynamic> json) =>
    NavigationTreeModel()
      ..articles = (json['articles'] as List<dynamic>?)
          ?.map((e) => HomeArticleModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..cid = json['cid'] as num?
      ..name = json['name'] as String?;

Map<String, dynamic> _$NavigationTreeModelToJson(
        NavigationTreeModel instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'cid': instance.cid,
      'name': instance.name,
    };
