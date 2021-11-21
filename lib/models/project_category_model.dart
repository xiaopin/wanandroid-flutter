import 'package:json_annotation/json_annotation.dart';

part 'project_category_model.g.dart';

@JsonSerializable()
class ProjectCategoryModel {
  ProjectCategoryModel();

  List? children;
  num? courseId;
  num? id;
  String? name;
  num? order;
  num? parentChapterId;
  bool? userControlSetTop;
  num? visible;
  
  factory ProjectCategoryModel.fromJson(Map<String,dynamic> json) => _$ProjectCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectCategoryModelToJson(this);
}
