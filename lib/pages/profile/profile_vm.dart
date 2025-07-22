import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/Constants.dart';
import 'package:flutter_sample/Utils/sp_utils.dart';
import 'package:flutter_sample/common_ui/loading.dart';
import 'package:flutter_sample/pages/profile/model/profile_list_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum ProfileListItemType { collect, update, about }

class ProfileViewModel with ChangeNotifier {
  bool? isLogin;
  String? userName;
  bool needUpdate = false;

  final List<ProfileListModel> settings = [
    ProfileListModel(id: ProfileListItemType.collect, title: "我的收藏", link: ""),
    ProfileListModel(id: ProfileListItemType.update, title: "检查更新", link: ""),
    ProfileListModel(id: ProfileListItemType.about, title: "关于我们", link: ""),
  ];

  Future initData() async {
    String? name = await SpUtils.getString(Constants.SP_USER_NAME);
    if (name == null || name.isEmpty == true) {
      userName = "未登录";
      isLogin = false;
    } else {
      userName = name;
      isLogin = true;
    }
    shuldShowUpdateDot();

    notifyListeners();
  }

  Future logout() async {
    bool result = await WanApi.instance().requestLogout();
    if (result) {
      SpUtils.remove(Constants.SP_USER_NAME);
      SpUtils.remove(Constants.SP_COOKIE_LIST);
      initData();
    } else {
      showToast("网络异常！");
    }
  }

  /// 检查版本更新
  Future shuldShowUpdateDot() async {
    SpUtils.saveString(Constants.SP_NEW_APP_VERSION, "0.0.0");
    var packageInfo = await PackageInfo.fromPlatform();
    // 获取当前版本
    String buildNumber = packageInfo.buildNumber;
    String newBuildNumber = await SpUtils.getString(
      Constants.SP_NEW_APP_VERSION,
    );
    if ((int.tryParse(buildNumber) ?? 0) >=
        (int.tryParse(newBuildNumber) ?? 0)) {
      needUpdate = true;
    } else {
      needUpdate = false;
    }
  }

  /// 外部浏览器打开链接
  Future openOutLink(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      return launchUrl(url);
    }
    return null;
  }
}
