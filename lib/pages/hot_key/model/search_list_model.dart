import 'package:json_annotation/json_annotation.dart';

part 'search_list_model.g.dart';

@JsonSerializable()
class SearchListModel {
  num? curPage;
  List<SearchListItemModel>? datas;
  num? offset;
  bool? over;
  num? pageCount;
  num? size;
  num? total;

  SearchListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory SearchListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchListModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchListModelToJson(this);
}

@JsonSerializable()
class SearchListItemModel {
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
  List<Tags>? tags;
  String? title;
  num? type;
  num? userId;
  num? visible;
  num? zan;

  SearchListItemModel({
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

  factory SearchListItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchListItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchListItemModelToJson(this);
}

@JsonSerializable()
class Tags {
  String? name;
  String? url;

  Tags({this.name, this.url});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
