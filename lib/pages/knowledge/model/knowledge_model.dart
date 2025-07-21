import 'dart:math';

import 'package:flutter_sample/pages/knowledge/model/Knowledge_detail_param.dart';
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

  static List<KnowledgeModel> arrayFromJson(dynamic json) {
    if (json != null && json is List) {
      return json.map((element) => KnowledgeModel.fromJson(element)).toList();
    }
    return [];
  }

  /// children标题集合
  String? subTitle() {
    return children?.map((element) => element.name).toString();
  }

  /// 知识体系下的文章列表(name,id)
  List<KnowledgeDetailParam>? detailParams() {
    return children
        ?.map(
          (element) => KnowledgeDetailParam(
            id: "${element.id}",
            title: element.name ?? "",
          ),
        )
        .toList();
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
