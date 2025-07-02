// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerModel _$HomeBannerModelFromJson(Map<String, dynamic> json) =>
    HomeBannerModel(
      desc: json['desc'] as String?,
      id: json['id'] as num?,
      imagePath: json['imagePath'] as String?,
      isVisible: json['isVisible'] as num?,
      order: json['order'] as num?,
      title: json['title'] as String?,
      type: json['type'] as num?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$HomeBannerModelToJson(HomeBannerModel instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };

HomeBannerListModel _$HomeBannerListModelFromJson(Map<String, dynamic> json) =>
    HomeBannerListModel(
      bannerList:
          (json['bannerList'] as List<dynamic>?)
              ?.map(
                (e) =>
                    e == null
                        ? null
                        : HomeBannerModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$HomeBannerListModelToJson(
  HomeBannerListModel instance,
) => <String, dynamic>{'bannerList': instance.bannerList};
