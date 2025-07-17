import 'package:json_annotation/json_annotation.dart';

part 'common_websits_list_model.g.dart';
@JsonSerializable()
class CommonWebsitsListModel {

  String? category;
  String? icon;
  String? name;
  int? order;
  num? visible;
  int? id;
  String? link;

  CommonWebsitsListModel({this.category,this.icon,this.id,this.link,this.name,this.order,this.visible});

  factory CommonWebsitsListModel.fromJson(Map<String, dynamic> json) =>
      _$CommonWebsitsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommonWebsitsListModelToJson(this);

  static List<CommonWebsitsListModel>? arrayFromJson(dynamic json){
    if (json != null && json is List){
      return json.map((element) => CommonWebsitsListModel.fromJson(element)).toList();
    }
    return null;
  }
}