// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_websits_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonWebsitsListModel _$CommonWebsitsListModelFromJson(
  Map<String, dynamic> json,
) => CommonWebsitsListModel(
  category: json['category'] as String?,
  icon: json['icon'] as String?,
  id: (json['id'] as num?)?.toInt(),
  link: json['link'] as String?,
  name: json['name'] as String?,
  order: (json['order'] as num?)?.toInt(),
  visible: json['visible'] as num?,
);

Map<String, dynamic> _$CommonWebsitsListModelToJson(
  CommonWebsitsListModel instance,
) => <String, dynamic>{
  'category': instance.category,
  'icon': instance.icon,
  'name': instance.name,
  'order': instance.order,
  'visible': instance.visible,
  'id': instance.id,
  'link': instance.link,
};
