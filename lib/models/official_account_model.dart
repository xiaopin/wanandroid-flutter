import 'package:json_annotation/json_annotation.dart';

part 'official_account_model.g.dart';

@JsonSerializable()
class OfficialAccountModel {
  OfficialAccountModel();

  List? children;
  num? courseId;
  num? id;
  String? name;
  num? order;
  num? parentChapterId;
  bool? userControlSetTop;
  num? visible;
  
  factory OfficialAccountModel.fromJson(Map<String,dynamic> json) => _$OfficialAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfficialAccountModelToJson(this);
}
