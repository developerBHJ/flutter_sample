import 'package:flutter/material.dart';

class RouteUtil {
  RouteUtil._();

  static final navigationKey = GlobalKey<NavigatorState>();
  // app根节点context
  static BuildContext get context => navigationKey.currentContext!;
  //
  static NavigatorState get navigator => navigationKey.currentState!;

  /// 普通跳转
  static Future push(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool? maintainState,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog ?? false,
        settings: settings,
        maintainState: maintainState ?? true,
      ),
    );
  }

  /// 根据路由名称跳转
  static Future pushForNamed(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  /// 自定义路由跳转
  static Future pushForPageRoute(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  /// 清空栈，只留目标页面
  static Future pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool? maintainState,
  }) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog ?? false,
        settings: settings,
        maintainState: maintainState ?? true,
      ),
      (route) => false,
    );
  }

  /// 新路由替换当前路由
  static Future pushReplacement(
    BuildContext context,
    Route route, {
    Object? arguments,
  }) {
    return Navigator.pushReplacement(context, route, result: arguments);
  }

  /// 新路由替换当前路由
  static Future pushReplacementNamed(
    BuildContext context,
    String name, {
    Object? arguments,
    Object? result,
  }) {
    return Navigator.pushReplacementNamed(
      context,
      name,
      result: result,
      arguments: arguments,
    );
  }

  /// 关闭当前页面
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  /// 关闭当前页面；带返回值
  static void popOfData<T extends Object?>(BuildContext context, {T? data}) {
    Navigator.of(context).pop(data);
  }
}
