import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/pages/login_register/model/user_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';
import 'package:oktoast/oktoast.dart';

class RegisterViewModel with ChangeNotifier {
  bool? isEnabled;
  String userName = "";
  String password = "";
  String rePasssword = "";

  Future checkSummit() async {
    bool enabled = true;
    if (userName.isEmpty == true ||
        password.isEmpty == true ||
        rePasssword.isEmpty == true) {
      enabled = false;
    } else if (password != rePasssword) {
      showToast("两次输入的密码不一致，请您重新输入");
      enabled = false;
    }
    isEnabled = enabled;
    notifyListeners();
  }

  /// 注册
  Future<bool> requestRegister() async {
    UserInfoModel? model = await WanApi.instance().requestRegister(
      userName,
      password,
      rePasssword,
    );
    return (model?.username != null) && (model?.username?.isNotEmpty == true);
  }
}
