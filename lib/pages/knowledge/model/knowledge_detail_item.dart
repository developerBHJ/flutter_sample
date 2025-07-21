import 'package:json_annotation/json_annotation.dart';
part 'knowledge_detail_item.g.dart';

@JsonSerializable()
class KnowledgeDetailItem {
  bool? adminAdd;
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
  bool? isAdminAdd;
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
  List<dynamic>? tags;
  String? title;
  num? type;
  num? userId;
  num? visible;
  num? zan;

  KnowledgeDetailItem({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory KnowledgeDetailItem.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeDetailItemFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeDetailItemToJson(this);

  static List<KnowledgeDetailItem> arrayFromJson(dynamic json) {
    if (json != null && json is List) {
      return json
          .map((element) => KnowledgeDetailItem.fromJson(element))
          .toList();
    }
    return [];
  }
}
