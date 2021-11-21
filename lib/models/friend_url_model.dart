import 'package:json_annotation/json_annotation.dart';

part 'friend_url_model.g.dart';

@JsonSerializable()
class FriendUrlModel {
  FriendUrlModel();

  String? category;
  String? icon;
  num? id;
  String? link;
  String? name;
  num? order;
  num? visible;
  
  factory FriendUrlModel.fromJson(Map<String,dynamic> json) => _$FriendUrlModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendUrlModelToJson(this);
}
