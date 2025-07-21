import 'package:dio/dio.dart';
import 'package:flutter_sample/common_ui/banner/home_banner_model.dart';
import 'package:flutter_sample/http/dio_instance.dart';
import 'package:flutter_sample/pages/home_page/model/home_list_model.dart';
import 'package:flutter_sample/pages/home_page/model/home_top_list_model.dart';
import 'package:flutter_sample/pages/hot_key/model/common_websits_list_model.dart';
import 'package:flutter_sample/pages/hot_key/model/hot_key_model.dart';
import 'package:flutter_sample/pages/hot_key/model/search_list_model.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_children.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_detail_item.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_model.dart';
import 'package:flutter_sample/pages/login_register/model/user_model.dart';
import 'package:flutter_sample/repository/api.dart';

class WanApi {
  WanApi._();

  static WanApi? _instance;

  static WanApi instance() {
    return _instance ??= WanApi._();
  }

  /// 获取首页文章列表
  Future<HomeListModel?> requestHomeList(String pageCount) async {
    Response response = await DioInstance.instance().get(
      path: Api.homeList(pageCount),
    );
    if (response.data is Map<String, dynamic>) {
      return HomeListModel.fromJson(response.data);
    }
    return null;
  }

  /// 获取首页置顶文章列表
  Future<HomeTopListModel> requestHomeTopList() async {
    Response response = await DioInstance.instance().get(path: Api.homeTopList);
    if (response.data is Map<String, dynamic>) {
      return HomeTopListModel.fromJson(response.data);
    }
    return HomeTopListModel(dataList: []);
  }

  /// 获取首页banner数据
  Future<List<HomeBannerModel?>?> requestHomeBannerList() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    HomeBannerListModel model = HomeBannerListModel.fromJson(response.data);
    return model.bannerList ?? [];
  }

  /// 收藏文章
  Future<bool> requestCollect(String id) async {
    Response response = await DioInstance.instance().post(
      path: "lg/collect/$id/json",
    );
    if (response.data != null && response.data == true) {
      return true;
    }
    return false;
  }

  /// 取消收藏文章
  Future<bool> requestUnCollect(String id) async {
    Response response = await DioInstance.instance().post(
      path: "lg/uncollect_originId/$id/json",
    );
    if (response.data != null && response.data == true) {
      return true;
    }
    return false;
  }

  /// 查询常用网站
  Future<List<CommonWebsitsListModel>?> requestCommonWebsiteList() async {
    Response response = await DioInstance.instance().get(path: "friend/json");
    return CommonWebsitsListModel.arrayFromJson(response.data);
  }

  /// 查询搜索热词
  Future<List<HotKeyModel>?> requestHotList() async {
    Response response = await DioInstance.instance().get(path: "hotkey/json");
    return HotKeyModel.arrayFromJson(response.data);
  }

  /// 根据关键词搜索
  Future<List<SearchListItemModel>?> requestSearch({String? keyWord}) async {
    Response response = await DioInstance.instance().post(
      path: "article/query/0/json",
      queryParameters: {"k": keyWord},
    );
    SearchListModel model = SearchListModel.fromJson(response.data);
    return model.datas;
  }

  /// 查询知识体系数据
  Future<List<KnowledgeModel>?> requestKnowlegeList() async {
    Response response = await DioInstance.instance().get(path: "tree/json");
    List<KnowledgeModel> list = KnowledgeModel.arrayFromJson(response.data);
    return list;
  }

    /// 查询知识体系数据
  Future<List<KnowledgeDetailItem>?> requestKnowlegeDetailList(String cId,int pageCount) async {
    Response response = await DioInstance.instance().get(path: "article/list/$pageCount/json",queryParameters: {"cid":cId});
    dynamic list = response.data["datas"];
    if (list != null && list is List){
      return KnowledgeDetailItem.arrayFromJson(list);
    }
    return null;
  }

  /// 注册
  Future<UserInfoModel?> requestRegister(
    String userName,
    String password,
    String repassword,
  ) async {
    Response response = await DioInstance.instance().post(
      path: "user/register",
      queryParameters: {
        "username": userName,
        "password": password,
        "repassword": repassword,
      },
    );
    UserInfoModel? model = UserInfoModel.fromJson(response.data);
    return model;
  }

  /// 登录
  Future<UserInfoModel?> requestLogin(String userName, String password) async {
    Response response = await DioInstance.instance().post(
      path: "user/login",
      queryParameters: {"username": userName, "password": password},
    );
    UserInfoModel? model = UserInfoModel.fromJson(response.data);
    return model;
  }

  /// 退出登录
  Future<bool> requestLogout() async {
    Response response = await DioInstance.instance().get(
      path: "user/logout/json",
    );
    return response.data != null && response.data == true;
  }
}
