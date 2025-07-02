import 'package:dio/dio.dart';
import 'package:flutter_sample/common_ui/banner/home_banner_model.dart';
import 'package:flutter_sample/http/dio_instance.dart';
import 'package:flutter_sample/pages/home_page/model/home_list_model.dart';
import 'package:flutter_sample/pages/home_page/model/home_top_list_model.dart';
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
    if (response.data is Map<String, dynamic>) {
      HomeBannerListModel model = HomeBannerListModel.fromJson(response.data);
      return model.bannerList ?? [];
    }
    return null;
  }
}
