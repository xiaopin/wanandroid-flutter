// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hot_keyword_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotKeywordModel _$SearchHotKeywordModelFromJson(
        Map<String, dynamic> json) =>
    SearchHotKeywordModel()
      ..id = json['id'] as num?
      ..link = json['link'] as String?
      ..name = json['name'] as String?
      ..order = json['order'] as num?
      ..visible = json['visible'] as num?;

Map<String, dynamic> _$SearchHotKeywordModelToJson(
        SearchHotKeywordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
