// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKeyModel _$HotKeyModelFromJson(Map<String, dynamic> json) => HotKeyModel(
  id: (json['id'] as num?)?.toInt(),
  link: json['link'] as String?,
  name: json['name'] as String?,
  order: (json['order'] as num?)?.toInt(),
  visible: json['visible'] as num?,
);

Map<String, dynamic> _$HotKeyModelToJson(HotKeyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
      'id': instance.id,
      'link': instance.link,
    };
