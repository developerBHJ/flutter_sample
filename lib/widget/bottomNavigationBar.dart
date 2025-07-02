import 'package:flutter/material.dart';
import 'package:flutter_sample/widget/navigationBarItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomnavigationbar extends StatefulWidget {
  // item标题数组
  final List<String> labels;
  // item 对应页面
  final List<Widget> pages;
  // item icon
  final List<String> icons;
  // item 选中icon
  final List<String> activeIcons;
  // 点击事件回调
  ValueChanged<int>? tapCompletion;
  // 选中下标
  int currentIndex = 0;
  //页面主题
  final ThemeData? themeData;
  //底部导航栏风格
  final BottomNavigationBarType? bottomNavigationBarType;
  //底部导航栏icon宽高
  final double? bottomBarIconWidth;
  final double? bottomBarIconHeight;

  CustomBottomnavigationbar({
    super.key,
    required this.labels,
    required this.pages,
    required this.icons,
    required this.activeIcons,
    this.tapCompletion,
    this.currentIndex = 0,
    this.themeData,
    this.bottomNavigationBarType,
    this.bottomBarIconWidth,
    this.bottomBarIconHeight,
  }) {
    if (pages.length != labels.length &&
        pages.length != icons.length &&
        pages.length != activeIcons.length) {
      throw Exception("数组长度必须保持一致");
    }
  }

  @override
  State<StatefulWidget> createState() => _CustomBottomnavigationbarState();
}

class _CustomBottomnavigationbarState extends State<CustomBottomnavigationbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: widget.currentIndex, children: widget.pages),
      ),
      bottomNavigationBar: Theme(
        data:
            widget.themeData ??
            Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
        child: BottomNavigationBar(
          items: _bottomItemList(),
          type: widget.bottomNavigationBarType ?? BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
          unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
          currentIndex: widget.currentIndex,
          onTap: (index) {
            if (widget.currentIndex == index) {
              return;
            }
            widget.tapCompletion?.call(index);
            widget.currentIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.pages.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Image.asset(
            widget.icons[i],
            width: widget.bottomBarIconWidth ?? 32,
            height: widget.bottomBarIconHeight ?? 32,
          ),
          activeIcon: NavigationBarItem(
            builder:
                (_) => Image.asset(
                  widget.activeIcons[i],
                  width: widget.bottomBarIconWidth ?? 32,
                  height: widget.bottomBarIconHeight ?? 32,
                ),
          ),
          label: widget.labels[i],
        ),
      );
    }
    return items;
  }
}
