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

@JsonSerializable()
class HomeBannerListModel {
  List<HomeBannerModel?>? bannerList = [];

  HomeBannerListModel({this.bannerList});
  factory HomeBannerListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerListModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBannerListModelToJson(this);
}
