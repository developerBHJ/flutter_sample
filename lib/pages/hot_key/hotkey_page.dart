import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/common_ui/smart_refresh_widget.dart';
import 'package:flutter_sample/pages/hot_key/hot_key_vm.dart';
import 'package:flutter_sample/pages/hot_key/search_page.dart';
import 'package:flutter_sample/pages/webView/webview_widget.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HotkeyPage extends StatefulWidget {
  const HotkeyPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotkeyPage> {
  final HotKeyViewModel viewModel = HotKeyViewModel();
  late RefreshController _controller;

  @override
  void initState() {
    _controller = RefreshController(initialRefresh: false);
    super.initState();
    viewModel.reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: SafeArea(
        child: SmartRefreshWidget(
          controller: _controller,
          enablePullUp: false,
          onRefresh: () {
            viewModel.reloadData(
              completion: () {
                _controller.refreshCompleted();
              },
            );
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchBar(
                  onTap: () {
                    RouteUtil.push(context, SearchPage());
                  },
                ),
                SizedBox(height: 16.r),
                _hotListView(),
                _titleView("常用网站"),
                _commonWebsiteListView(itemClick: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar({GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 10.w,
          bottom: 10.w,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5.r, color: Colors.grey),
            bottom: BorderSide(width: 0.5.r, color: Colors.grey),
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Row(
          children: [
            Text(
              "搜索热词",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            Expanded(child: SizedBox()),
            Image.asset(
              "assets/images/icon_search.png",
              width: 30.r,
              height: 30.r,
            ),
          ],
        ),
      ),
    );
  }

  /// 搜索热词列表
  Widget _hotListView() {
    return Consumer<HotKeyViewModel>(
      builder: (context, value, child) {
        return _girdView(
          builder: (context, index) {
            var name = value.hotkeyList[index].name ?? "";
            return _girdItem(
              name,
              onTap: () {
                RouteUtil.push(context, SearchPage(keyWord: name));
              },
            );
          },
          itemCount: value.hotkeyList.length,
        );
      },
    );
  }

  /// 常用网站列表
  Widget _commonWebsiteListView({GestureCancelCallback? itemClick}) {
    return Consumer<HotKeyViewModel>(
      builder: (context, value, child) {
        return _girdView(
          builder: (context, index) {
            return _girdItem(
              value.websiteList[index].name,
              onTap: () {
                RouteUtil.pushWebView(
                  context,
                  value.websiteList[index].link ?? "",
                  type: WebViewType.URL,
                  title: value.websiteList[index].name,
                );
              },
            );
          },
          itemCount: value.websiteList.length,
        );
      },
    );
  }

  /// 通用网格列表
  Widget _girdView({
    required NullableIndexedWidgetBuilder builder,
    int? itemCount,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        // shrinkWrap 控制尺寸计算方式
        // shrinkWrap：false 组件会尽可能占据父组件空间（即使内容较少）
        // shrinkWrap：true 组件会根据子组件总高度自适应尺寸（适合嵌套或动态布局）
        shrinkWrap: true,
        // 禁止滑动
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // 最大横轴范围
          maxCrossAxisExtent: 120.r,
          // 主轴间隔
          mainAxisSpacing: 10.r,
          // 横轴间隔
          crossAxisSpacing: 10.r,
          // 宽高比
          childAspectRatio: 2.5,
        ),
        itemBuilder: builder,
        itemCount: itemCount,
      ),
    );
  }

  Widget _girdItem(String? title, {GestureTapCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.r),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: blackTextStyle13,
        ),
      ),
    );
  }

  Widget _titleView(String title) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16.r,
        right: 16.r,
        top: 16.r,
        bottom: 16.r,
      ),
      child: Text(title, style: titleTextStyle15),
    );
  }
}
