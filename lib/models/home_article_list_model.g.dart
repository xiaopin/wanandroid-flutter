// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_article_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticleListModel _$HomeArticleListModelFromJson(
        Map<String, dynamic> json) =>
    HomeArticleListModel()
      ..curPage = json['curPage'] as num?
      ..datas = (json['datas'] as List<dynamic>?)
          ?.map((e) => HomeArticleModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..offset = json['offset'] as num?
      ..over = json['over'] as bool?
      ..pageCount = json['pageCount'] as num?
      ..size = json['size'] as num?
      ..total = json['total'] as num?;

Map<String, dynamic> _$HomeArticleListModelToJson(
        HomeArticleListModel instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
