import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/hot_key/model/common_websits_list_model.dart';
import 'package:flutter_sample/pages/hot_key/model/hot_key_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class HotKeyViewModel with ChangeNotifier {
  List<HotKeyModel> hotkeyList = [];
  List<CommonWebsitsListModel> websiteList = [];

  Future reloadData({VoidCallback? completion}) async {
    getHotKeyList(
      completion: () {
        getCommonwebsitesList(
          completion: () {
            completion?.call();
          },
        );
      },
    );
  }

  Future getHotKeyList({VoidCallback? completion}) async {
    var list = await WanApi.instance().requestHotList();
    if (list != null) {
      hotkeyList = list;
      notifyListeners();
    }
    completion?.call();
  }

  Future getCommonwebsitesList({VoidCallback? completion}) async {
    var list = await WanApi.instance().requestCommonWebsiteList();
    if (list != null) {
      websiteList = list;
      notifyListeners();
    }
    completion?.call();
  }
}
