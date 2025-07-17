import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_sample/Constants.dart';
import 'dart:developer';

import 'package:flutter_sample/Utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SpUtils.getStringList(Constants.SP_COOKIE_LIST).then((cookieList) {
      options.headers[HttpHeaders.cookieHeader] = cookieList;
      handler.next(options);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 取出登录接口返回的cookie
    if (response.requestOptions.path.contains("user/login")) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      // 遍历cookie，保存
      List<String> cookieList = [];
      if (list is List) {
        for (String? cookie in list) {
          cookieList.add(cookie ?? "");
          log("cookieList = ${cookie.toString()}");
        }
      }
      SpUtils.saveStringList(Constants.SP_COOKIE_LIST, cookieList);
    }
    super.onResponse(response, handler);
  }
}
