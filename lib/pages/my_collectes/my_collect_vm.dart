import 'package:flutter/foundation.dart';
import 'package:flutter_sample/pages/my_collectes/model/my_collect_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';
import 'dart:developer';

class MyCollectViewModel with ChangeNotifier {
  List<MyCollectListModel> dataSource = [];
  int _pageCount = 0;

  Future reloadData(bool loadMore) async {
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      dataSource.clear();
    }
    List<MyCollectListModel>? list = await WanApi.instance()
        .requestMyCollectList("$_pageCount");
    if (list != null && list.isNotEmpty == true) {
      dataSource.addAll(list);
      notifyListeners();
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
  }

  /// 取消收藏
  Future requestCancelCollect(String cId,String originId) async {
    bool result = await WanApi.instance().requestMyCollectCancel(cId, originId);
    if (result) {
      try {
        int index = dataSource.indexWhere(
          (element) => "${element.id ?? 0}" == cId,
        );
        dataSource.removeAt(index);
        notifyListeners();
      } catch (error) {
        log("cancelCollect error=$error");
      }
    }
  }
}
