import 'package:flutter/material.dart';
import 'package:flutter_sample/app.dart';
import 'package:flutter_sample/http/dio_instance.dart';
import 'package:flutter_sample/repository/api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  DioInstance.instance().initDio(Api.baseUrl);
  await ScreenUtil.ensureScreenSize();
  runApp(const App());
}
