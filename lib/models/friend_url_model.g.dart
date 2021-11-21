// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendUrlModel _$FriendUrlModelFromJson(Map<String, dynamic> json) =>
    FriendUrlModel()
      ..category = json['category'] as String?
      ..icon = json['icon'] as String?
      ..id = json['id'] as num?
      ..link = json['link'] as String?
      ..name = json['name'] as String?
      ..order = json['order'] as num?
      ..visible = json['visible'] as num?;

Map<String, dynamic> _$FriendUrlModelToJson(FriendUrlModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
