import 'package:dio/dio.dart';
import 'package:flutter_sample/http/http_method.dart';
import 'package:flutter_sample/http/interceptor/response_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;
  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  Dio _dio = Dio();
  // 超时
  final _defultTimeOut = Duration(seconds: 30);
  var _inited = false;

  /// 初始化
  void initDio(
    String baseUrl, {
    String? method = HttpMethod.get,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) async {
    _dio.options = buildBaseOptions(
      method: method,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      responseType: responseType,
      contentType: contentType,
    );
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(LogInterceptor());
    _inited = true;
  }

  BaseOptions buildBaseOptions({
    required String baseUrl,
    String? method = HttpMethod.get,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType,
    String? contentType,
  }) {
    return BaseOptions(
      method: method,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? _defultTimeOut,
      receiveTimeout: receiveTimeout ?? _defultTimeOut,
      sendTimeout: sendTimeout ?? _defultTimeOut,
      responseType: responseType,
      contentType: contentType,
    );
  }

  /// 更换BaseUrl
  void changeBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  /// POST 请求
  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (_inited == false) {
      throw Exception("you should call initDio() first!");
    }
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            method: HttpMethod.post,
            receiveTimeout: _defultTimeOut,
            sendTimeout: _defultTimeOut,
          ),
    );
  }

  /// GET 请求
  Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (_inited == false) {
      throw Exception("you should call initDio() first!");
    }
    return _dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            method: HttpMethod.get,
            receiveTimeout: _defultTimeOut,
            sendTimeout: _defultTimeOut,
          ),
    );
  }
}
