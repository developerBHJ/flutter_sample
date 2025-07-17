import 'package:flutter/foundation.dart';
import 'package:flutter_sample/Constants.dart';
import 'package:flutter_sample/Utils/sp_utils.dart';
import 'package:flutter_sample/pages/login_register/model/user_model.dart';
import 'package:flutter_sample/repository/wan_api.dart';
import 'package:oktoast/oktoast.dart';

class LoginViewModel with ChangeNotifier {
  String userName = "";
  String password = "";

  bool checkSummit() {
    bool enabled = true;
    if (userName.isEmpty == true || password.isEmpty == true) {
      showToast(userName.isEmpty == true ? "请输入用户名" : "请输入密码");
      enabled = false;
    }
    return enabled;
  }

  /// 登录
  Future<bool> requestLogin() async {
    UserInfoModel? model = await WanApi.instance().requestLogin(
      userName,
      password,
    );
    if (model?.username != null) {
      SpUtils.saveString(Constants.SP_USER_NAME, model?.username ?? "");
    }
    return model?.token != null;
  }
}
