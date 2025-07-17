import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/pages/profile/model/profile_list_model.dart';
import 'package:flutter_sample/pages/profile/profile_vm.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_sample/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileViewModel viewModel = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              _headerView(
                onTap: () {
                  _userLogin();
                },
              ),
              _listView(
                itemClick: (value) {
                  _itemClick(value);
                },
              ),
              _logout(
                onTap: () {
                  _userLogout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerView({GestureTapCallback? onTap}) {
    return Container(
      width: double.infinity,
      height: 200.h,
      color: Colors.greenAccent,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35.r),
              child: Selector<ProfileViewModel, bool?>(
                builder: (context, value, child) {
                  return Image.asset(
                    value == true
                        ? "assets/images/luoxiaohei.png"
                        : "assets/images/logo.png",
                    width: 70.r,
                    height: 70.r,
                    fit: BoxFit.fill,
                  );
                },
                selector: (context, value) {
                  return viewModel.isLogin;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.r),
              child: Selector<ProfileViewModel, String?>(
                builder: (context, value, child) {
                  return Text(value ?? "未登录", style: blackTextStyle13);
                },
                selector: (context, value) {
                  return viewModel.userName;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView({ValueChanged<ProfileListModel>? itemClick}) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _listItemView(
            viewModel.settings[index],
            onTap: () {
              itemClick?.call(viewModel.settings[index]);
            },
          );
        },
        itemCount: viewModel.settings.length,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _listItemView(ProfileListModel model, {GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 16.r),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 12.r, right: 12.r),
            padding: EdgeInsets.only(
              left: 12.r,
              top: 16.r,
              bottom: 16.r,
              right: 12.r,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.r,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(model.title ?? "", style: blackTextStyle13),
                ),
                Image.asset(
                  "assets/images/img_arrow_right.png",
                  width: 30.r,
                  height: 30.r,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logout({GestureCancelCallback? onTap}) {
    return Selector<ProfileViewModel, bool?>(
      builder: (context, value, child) {
        return value == true
            ? GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.only(left: 12.r, right: 12.r, bottom: 16.r),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: Colors.teal,
                ),
                child: Text(
                  "退出登录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.r,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            : SizedBox(height: 0);
      },
      selector: (context, value) {
        return viewModel.isLogin;
      },
    );
  }

  void _userLogin() {
    if (viewModel.isLogin == false) {
      RouteUtil.pushForNamed(context, RoutePath.login);
    }
  }

  void _userLogout() {
    if (viewModel.isLogin == true) {
      viewModel.logout();
    }
  }

  void _itemClick(ProfileListModel model) {
    switch (model.id) {
      case ProfileListItemType.collect:
        log(model.title);
      case ProfileListItemType.update:
        log(model.title);
      case ProfileListItemType.about:
        log(model.title);
    }
  }
}
