import 'package:json_annotation/json_annotation.dart';

part 'home_article_model.g.dart';

@JsonSerializable()
class HomeArticleModel {
  HomeArticleModel();

  String? apkLink;
  num? audit;
  String? author;
  bool? canEdit;
  num? chapterId;
  String? chapterName;
  bool? collect;
  num? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  num? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  num? publishTime;
  num? realSuperChapterId;
  num? selfVisible;
  num? shareDate;
  String? shareUser;
  num? superChapterId;
  String? superChapterName;
  List? tags;
  String? title;
  num? type;
  num? userId;
  num? visible;
  num? zan;

  get articleAuthor {
    String author = this.author ?? "";
    String shareUser = this.shareUser ?? "";
    if (author.isNotEmpty) return author;
    if (shareUser.isNotEmpty) return shareUser;
    return "匿名";
  }

  get avatarUrl {
    // 随机头像
    return 'http://placeimg.com/100/100/${articleAuthor.hashCode.toString()}';
  }

  factory HomeArticleModel.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeArticleModelToJson(this);
}
