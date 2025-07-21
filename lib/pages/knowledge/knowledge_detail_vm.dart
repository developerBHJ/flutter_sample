import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/common_ui/loading.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_children.dart';
import 'package:flutter_sample/pages/knowledge/model/Knowledge_detail_param.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_detail_item.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class KnowledgeDetailViewModel with ChangeNotifier {
  List<Tab> tabList = [];
  List<KnowledgeDetailItem> items = [];
  int pageCount = 0;

  void initTabs(List<KnowledgeDetailParam> list) {
    tabList = list.map((element) => Tab(text: element.title)).toList();
  }

  Future requestDetailList(String cId, bool loadMore) async {
    Loading.showLoading();
    if (loadMore) {
      pageCount++;
    } else {
      pageCount = 0;
      items.clear();
    }
    List<KnowledgeDetailItem>? list = await WanApi.instance()
        .requestKnowlegeDetailList(cId, pageCount);
    if (list?.isNotEmpty == true) {
      items.addAll(list ?? []);
      notifyListeners();
    } else {
      if (loadMore && pageCount > 0) {
        pageCount--;
      }
    }
    Loading.dismissAll();
  }
}
