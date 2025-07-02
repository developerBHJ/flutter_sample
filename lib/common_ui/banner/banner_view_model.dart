import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_sample/common_ui/banner/home_banner_model.dart';
import 'dart:developer';

import 'package:flutter_sample/http/dio_instance.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class HomePageBannerViewModel {
  // 初始化数据
  final BannerModel state = BannerModel();
  //获取流控制器
  final _controller = StreamController<BannerModel>.broadcast(
    onListen: () {
      log("HomePageBannerViewModel _controller onListen");
    },
    onCancel: () {
      log("HomePageBannerViewModel _controller onCancel");
    },
  );

  /// 获取流控制器正在控制的流
  Stream<BannerModel> getStream() {
    return _controller.stream;
  }

  /// 获取banner数据
  Future requetBannerList() async {
    try{
      List<HomeBannerModel?>? bannerList = await WanApi.instance().requestHomeBannerList();
      state.bannerList = bannerList;
    }catch(error){
      state.bannerList = [];
    }
    _controller.add(state);
  }

  void dispose() {
    _controller.close();
  }
}

class BannerModel {
  List<HomeBannerModel?>? bannerList = [];
}
