import 'package:flutter_sample/pages/home_page/model/home_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_top_list_model.g.dart';

@JsonSerializable()
class HomeTopListModel {
  List<HomeListItemData>? dataList = [];

  HomeTopListModel({this.dataList});

  factory HomeTopListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeTopListModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$HomeTopListModelToJson(this);
}
