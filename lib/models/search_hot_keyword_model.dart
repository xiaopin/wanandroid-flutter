import 'package:json_annotation/json_annotation.dart';

part 'search_hot_keyword_model.g.dart';

@JsonSerializable()
class SearchHotKeywordModel {
  SearchHotKeywordModel();

  num? id;
  String? link;
  String? name;
  num? order;
  num? visible;
  
  factory SearchHotKeywordModel.fromJson(Map<String,dynamic> json) => _$SearchHotKeywordModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchHotKeywordModelToJson(this);
}
