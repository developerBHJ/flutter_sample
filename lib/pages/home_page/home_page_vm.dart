import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_sample/pages/home_page/model/home_list_model.dart';
import 'package:flutter_sample/pages/home_page/model/home_top_list_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class HomePageViewModel with ChangeNotifier {
  List<HomeListItemData>? listData = [];
  int _pageCount = 0;

  Future requestListData(
    bool loadMore, {
    ValueChanged<bool>? completion,
  }) async {
    // 加载更多
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      listData?.clear();
    }

    // 先获取置顶列表
    _getHomeTopList(loadMore).then((topList) {
      if (!loadMore) {
        listData?.addAll(topList ?? []);
      }
      _getHomeList(loadMore).then((homeList) {
        listData?.addAll(homeList ?? []);
        // 完成后通知并抛出回调
        notifyListeners();
        completion?.call(loadMore);
      });
    });
  }

  Future<List<HomeListItemData>?> _getHomeList(bool loadMore) async {
    HomeListModel? data = await WanApi.instance().requestHomeList(
      "$_pageCount",
    );
    if (data != null && data.datas?.isNotEmpty == true) {
      return data.datas;
    } else {
      // 加载更多，拿不到数据，页码减一
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
    return [];
  }

  Future<List<HomeListItemData>?> _getHomeTopList(bool loadMore) async {
    //加载更多场景不需要获取置顶数据
    if (loadMore) {
      return [];
    }
    HomeTopListModel? data = await WanApi.instance().requestHomeTopList();
    return data.dataList;
  }

  Future collect(num? id) async{
    int index = listData?.indexWhere((item) => item.id == id) ?? 0;
    bool result = await WanApi.instance().requestCollect("$id");
    if(result){
      listData?[index].collect = true;
      notifyListeners();
    }
  }

  Future unCollected(num? id) async {
        int index = listData?.indexWhere((item) => item.id == id) ?? 0;
    bool result = await WanApi.instance().requestUnCollect("$id");
    if(result){
      listData?[index].collect = false;
      notifyListeners();
    }
  }
}
