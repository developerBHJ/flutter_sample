import 'package:json_annotation/json_annotation.dart';

part 'hot_key_model.g.dart';
@JsonSerializable()
class HotKeyModel {
  String? name;
  int? order;
  num? visible;
  int? id;
  String? link;

  HotKeyModel({this.id,this.link,this.name,this.order,this.visible});

  factory HotKeyModel.fromJson(Map<String, dynamic> json) =>
      _$HotKeyModelFromJson(json);
  Map<String, dynamic> toJson() => _$HotKeyModelToJson(this);

  static List<HotKeyModel>? arrayFromJson(dynamic json){
    if (json != null && json is List){
      return json.map((element) => HotKeyModel.fromJson(element)).toList();
    }
    return null;
  }
}