import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/hot_key/model/search_list_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class SearchPageViewModel with ChangeNotifier {
  List<SearchListItemModel>? dataSource;

  Future requestSearchList({String? keyWord}) async {
    List<SearchListItemModel>? list = await WanApi.instance().requestSearch(
      keyWord: keyWord,
    );
    if (list?.isNotEmpty == true) {
      dataSource = list;
      notifyListeners();
    }
  }

  void clearSearchData() {
    dataSource?.clear();
    notifyListeners();
  }
}
