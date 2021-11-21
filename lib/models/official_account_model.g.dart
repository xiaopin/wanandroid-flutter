// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficialAccountModel _$OfficialAccountModelFromJson(
        Map<String, dynamic> json) =>
    OfficialAccountModel()
      ..children = json['children'] as List<dynamic>?
      ..courseId = json['courseId'] as num?
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..order = json['order'] as num?
      ..parentChapterId = json['parentChapterId'] as num?
      ..userControlSetTop = json['userControlSetTop'] as bool?
      ..visible = json['visible'] as num?;

Map<String, dynamic> _$OfficialAccountModelToJson(
        OfficialAccountModel instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
