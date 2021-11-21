// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructureTreeModel _$StructureTreeModelFromJson(Map<String, dynamic> json) =>
    StructureTreeModel()
      ..courseId = json['courseId'] as num?
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..order = json['order'] as num?
      ..parentChapterId = json['parentChapterId'] as num?
      ..userControlSetTop = json['userControlSetTop'] as bool?
      ..visible = json['visible'] as num?
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => StructureTreeModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StructureTreeModelToJson(StructureTreeModel instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
      'children': instance.children,
    };
