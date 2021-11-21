import 'package:json_annotation/json_annotation.dart';

part 'home_banner_model.g.dart';

@JsonSerializable()
class HomeBannerModel {
  HomeBannerModel();

  String? desc;
  num? id;
  String? imagePath;
  num? isVisible;
  num? order;
  String? title;
  num? type;
  String? url;
  
  factory HomeBannerModel.fromJson(Map<String,dynamic> json) => _$HomeBannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBannerModelToJson(this);
}
