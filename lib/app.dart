import 'package:flutter/material.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_sample/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

/// 设计尺寸
Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  // 逻辑长边
  final logicalLongestSide =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  // 缩放比例 designSize越小，元素越大
  const scaleFactor = 0.95;
  // 缩放后的逻辑短边和长边
  return Size(
    logicalShortestSide * scaleFactor,
    logicalLongestSide * scaleFactor,
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: designSize,
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          navigatorKey: RouteUtil.navigationKey,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RoutePath.home,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
