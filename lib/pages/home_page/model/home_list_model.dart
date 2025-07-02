import 'package:json_annotation/json_annotation.dart';

part 'home_list_model.g.dart';

@JsonSerializable()
class HomeListModel {
  num? curPage;
  List<HomeListItemData>? datas;
  num? offset;
  bool? over;
  num? pageCount;
  num? size;
  num? total;

  HomeListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory HomeListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeListModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeListModelToJson(this);
}

@JsonSerializable()
class HomeListItemData {
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

  HomeListItemData({
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
    //0=普通 1=置顶
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory HomeListItemData.fromJson(Map<String, dynamic> json) =>
      _$HomeListItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeListItemDataToJson(this);
}
