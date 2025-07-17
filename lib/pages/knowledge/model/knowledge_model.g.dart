// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeModel _$KnowledgeModelFromJson(Map<String, dynamic> json) =>
    KnowledgeModel(
      articleList: json['articleList'] as List<dynamic>?,
      author: json['author'] as String?,
      children:
          (json['children'] as List<dynamic>?)
              ?.map(
                (e) => KnowledgeChildren.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      courseId: json['courseId'] as num?,
      cover: json['cover'] as String?,
      desc: json['desc'] as String?,
      id: json['id'] as num?,
      lisense: json['lisense'] as String?,
      lisenseLink: json['lisenseLink'] as String?,
      name: json['name'] as String?,
      order: json['order'] as num?,
      parentChapterId: json['parentChapterId'] as num?,
      type: json['type'] as num?,
      userControlSetTop: json['userControlSetTop'] as bool?,
      visible: json['visible'] as num?,
    );

Map<String, dynamic> _$KnowledgeModelToJson(KnowledgeModel instance) =>
    <String, dynamic>{
      'articleList': instance.articleList,
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

KnowledgeChildren _$KnowledgeChildrenFromJson(Map<String, dynamic> json) =>
    KnowledgeChildren(
      articleList: json['articleList'] as List<dynamic>?,
      author: json['author'] as String?,
      children: json['children'] as List<dynamic>?,
      courseId: json['courseId'] as num?,
      cover: json['cover'] as String?,
      desc: json['desc'] as String?,
      id: json['id'] as num?,
      lisense: json['lisense'] as String?,
      lisenseLink: json['lisenseLink'] as String?,
      name: json['name'] as String?,
      order: json['order'] as num?,
      parentChapterId: json['parentChapterId'] as num?,
      type: json['type'] as num?,
      userControlSetTop: json['userControlSetTop'] as bool?,
      visible: json['visible'] as num?,
    );

Map<String, dynamic> _$KnowledgeChildrenToJson(KnowledgeChildren instance) =>
    <String, dynamic>{
      'articleList': instance.articleList,
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
