import 'package:json_annotation/json_annotation.dart';

part 'structure_tree_model.g.dart';

@JsonSerializable()
class StructureTreeModel {
  StructureTreeModel();

  num? courseId;
  num? id;
  String? name;
  num? order;
  num? parentChapterId;
  bool? userControlSetTop;
  num? visible;
  List<StructureTreeModel>? children;

  factory StructureTreeModel.fromJson(Map<String, dynamic> json) =>
      _$StructureTreeModelFromJson(json);
  Map<String, dynamic> toJson() => _$StructureTreeModelToJson(this);
}
