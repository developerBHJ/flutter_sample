import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/login_register/login_page.dart';
import 'package:flutter_sample/pages/login_register/register_page.dart';
import 'package:flutter_sample/widget/tab_page.dart';

/// 路由注册管理类
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.login:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.register:
        return pageRoute(RegisterPage(), settings: settings);
      default:
        return pageRoute(TabPage(), settings: settings);
    }
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? false,
    );
  }
}

class RoutePath {
  /// 首页/tab
  static const String home = "/";

  /// 登录
  static const String login = "login";

  /// 注册
  static const String register = "register";
}
