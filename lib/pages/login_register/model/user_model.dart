import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  bool? admin;
  List<dynamic>? chapterTops;
  num? coinCount;
  List<num?>? collectIds;
  String? email;
  String? icon;
  num? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  num? type;
  String? username;

  UserInfoModel({
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
