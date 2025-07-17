import 'package:json_annotation/json_annotation.dart';

part 'knowledge_model.g.dart';

@JsonSerializable()
class KnowledgeModel {
  List<dynamic>? articleList;
  String? author;
  List<KnowledgeChildren>? children;
  num? courseId;
  String? cover;
  String? desc;
  num? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  num? order;
  num? parentChapterId;
  num? type;
  bool? userControlSetTop;
  num? visible;

  KnowledgeModel({
    this.articleList,
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  factory KnowledgeModel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeModelFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeModelToJson(this);

  static List<KnowledgeModel> arrayFromJson(dynamic json){
    if (json != null && json is List){
      return json.map((element) => KnowledgeModel.fromJson(element)).toList();
    }
    return [];
  }
}

@JsonSerializable()
class KnowledgeChildren {
  List<dynamic>? articleList;
  String? author;
  List<dynamic>? children;
  num? courseId;
  String? cover;
  String? desc;
  num? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  num? order;
  num? parentChapterId;
  num? type;
  bool? userControlSetTop;
  num? visible;

  KnowledgeChildren({
    this.articleList,
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  factory KnowledgeChildren.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeChildrenToJson(this);
}
