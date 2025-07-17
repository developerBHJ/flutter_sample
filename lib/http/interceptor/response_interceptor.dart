import 'package:dio/dio.dart';
import 'package:flutter_sample/http/base_model.dart';
import 'package:oktoast/oktoast.dart';

class ResponseInterceptor extends Interceptor {
  /// 统一处理返回值-拦截器
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //修改未登录的错误码为-1001，其他错误码为-1，成功为0，建议对errorCode 判断当不为0的时候，均为错误。
    if (response.statusCode == 200) {
      // 蒲公英的接口不做处理
      if (response.requestOptions.path.contains("apiv2/app/check")) {
        handler.next(response);
      } else {
        var model = BaseModel.fromJson(response.data);
        if (model.errorCode == 0) {
          if (model.data == null) {
            handler.next(
              Response(requestOptions: response.requestOptions, data: true),
            );
          } else {
            handler.next(
              Response(
                requestOptions: response.requestOptions,
                data: model.data,
              ),
            );
          }
        } else if (model.errorCode == -1001) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              message: "未登录，请先登录",
            ),
          );
          showToast("请先登录");
        } else {
          handler.reject(DioException(requestOptions: response.requestOptions));
        }
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
