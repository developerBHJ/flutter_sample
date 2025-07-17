import 'package:flutter/foundation.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';

class KnowledgeViewModel with ChangeNotifier {
  List<KnowledgeModel>? dataSource;

  Future reloadData() async {
    List<KnowledgeModel>? list = await WanApi.instance().requestKnowlegeList();
    if (list?.isNotEmpty == true) {
      dataSource = list;
      notifyListeners();
    }
  }
}
