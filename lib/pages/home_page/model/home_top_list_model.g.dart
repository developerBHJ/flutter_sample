// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_top_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTopListModel _$HomeTopListModelFromJson(Map<String, dynamic> json) =>
    HomeTopListModel(
      dataList:
          (json['dataList'] as List<dynamic>?)
              ?.map((e) => HomeListItemData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$HomeTopListModelToJson(HomeTopListModel instance) =>
    <String, dynamic>{'dataList': instance.dataList};
