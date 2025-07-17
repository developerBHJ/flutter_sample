import 'package:json_annotation/json_annotation.dart';

part 'home_banner_model.g.dart';

@JsonSerializable()
class HomeBannerModel {
  final String? desc;
  final num? id;
  final String? imagePath;
  final num? isVisible;
  final num? order;
  final String? title;
  final num? type;
  final String? url;

  HomeBannerModel({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBannerModelToJson(this);
}

class HomeBannerListModel {
  List<HomeBannerModel?>? bannerList = [];

  HomeBannerListModel({this.bannerList});
  HomeBannerListModel.fromJson(dynamic json){
    if(json != null && json is List){
      json.forEach((obj){
      HomeBannerModel model = HomeBannerModel.fromJson(obj);
      bannerList?.add(model);
      }
      );
    }
  }
}
