import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/loading.dart';
import 'package:flutter_sample/pages/login_register/login_vm.dart';
import 'package:flutter_sample/pages/login_register/widget/input_bar.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_sample/routes/routes.dart';
import 'package:flutter_sample/widget/tab_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginViewModel viewModel = LoginViewModel();

  @override
  void dispose() {
    super.dispose();
    Loading.dismissAll();
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
          appBar: AppBar(title: SizedBox(height: 44.r)),
          body: Column(
            children: [
              SizedBox(height: 100.r),
              ClipRRect(
                borderRadius: BorderRadius.circular(60.r),
                child: Image.asset(
                  "assets/images/icon_android.png",
                  width: 200.r,
                  height: 120.r,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40.r),
              InputBar(
                title: "用户名",
                hint: "请输入用户民",
                valueChanged: (value) {
                  viewModel.userName = value ?? "";
                },
              ),
              SizedBox(height: 10.r),
              InputBar(
                title: "密码",
                hint: "请输入密码",
                obscureText: true,
                valueChanged: (value) {
                  viewModel.password = value ?? "";
                },
              ),
              SizedBox(height: 40.r),
              _bottomView(
                loginEvent: () {
                  _login();
                },
                registerEvent: () {
                  RouteUtil.pushForNamed(context, RoutePath.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomView({
    GestureTapCallback? loginEvent,
    GestureCancelCallback? registerEvent,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 12.r, right: 12.r),
      child: Row(
        spacing: 40.r,
        children: [
          Expanded(child: _loginButton("登录", onTap: loginEvent)),
          Expanded(child: _loginButton("注册", onTap: registerEvent)),
        ],
      ),
    );
  }

  Widget _loginButton(String title, {GestureCancelCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.r,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _login() {
    if (viewModel.checkSummit()) {
      viewModel.requestLogin().then((success) {
        if (success) {
          showToast("登录成功");
          RouteUtil.pushAndRemoveUntil(context, TabPage());
        }
      });
    }
  }
}
