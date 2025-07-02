import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//白色字体14号
TextStyle whiteTextStyle14 = TextStyle(color: Colors.white, fontSize: 14.sp);
//白色字体15号
TextStyle whiteTextStyle15 = TextStyle(color: Colors.white, fontSize: 15.sp);
//标题文本15号
TextStyle titleTextStyle15 = TextStyle(color: Colors.black, fontSize: 15.sp);
//黑色字体13号
TextStyle blackTextStyle13 = TextStyle(fontSize: 13.sp, color: Colors.black);
//普通字体，只做判空处理
Text normalText(String? text) {
  return Text(text ?? "",style: titleTextStyle15,);
}