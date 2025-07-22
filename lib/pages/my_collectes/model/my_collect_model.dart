import 'package:json_annotation/json_annotation.dart';

part 'my_collect_model.g.dart';

@JsonSerializable()
class MyCollectListModel {
  String? author;
  num? chapterId;
  String? chapterName;
  num? courseId;
  String? desc;
  String? envelopePic;
  num? id;
  String? link;
  String? niceDate;
  String? origin;
  num? originId;
  num? publishTime;
  String? title;
  num? userId;
  num? visible;
  num? zan;

  MyCollectListModel({
    this.author,
    this.chapterId,
    this.chapterName,
    this.courseId,
    this.desc,
    this.envelopePic,
    this.id,
    this.link,
    this.niceDate,
    this.origin,
    this.originId,
    this.publishTime,
    this.title,
    this.userId,
    this.visible,
    this.zan,
  });

  factory MyCollectListModel.fromJson(Map<String, dynamic> json) =>
      _$MyCollectListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCollectListModelToJson(this);

  static List<MyCollectListModel> arrayFromJson(dynamic json) {
    if (json != null && json is List) {
      return json
          .map((element) => MyCollectListModel.fromJson(element))
          .toList();
    }
    return [];
  }
}
