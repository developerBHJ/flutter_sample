import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/loading.dart';
import 'package:flutter_sample/pages/login_register/register_vm.dart';
import 'package:flutter_sample/pages/login_register/widget/input_bar.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterViewModel viewModel = RegisterViewModel();

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
                onSubmitted: (value) {
                  viewModel.checkSummit();
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
                onSubmitted: (value) {
                  viewModel.checkSummit();
                },
              ),
              SizedBox(height: 10.r),
              InputBar(
                title: "确认密码",
                hint: "请再次输入密码",
                obscureText: true,
                valueChanged: (value) {
                  viewModel.rePasssword = value ?? "";
                },
                onSubmitted: (value) {
                  viewModel.checkSummit();
                },
              ),
              SizedBox(height: 40.r),
              _registerButton(
                "注册",
                onTap: () {
                  _register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton(String title, {GestureCancelCallback? onTap}) {
    return Selector<RegisterViewModel, bool?>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.r,
            margin: EdgeInsets.only(left: 12.r, right: 12.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: value == true ? Colors.teal : Colors.grey,
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
      },
      selector: (context, value) {
        return viewModel.isEnabled;
      },
    );
  }

  void _register() {
    if (viewModel.isEnabled == true) {
      viewModel.requestRegister().then((success) {
        if (success) {
          RouteUtil.pop(context);
        }
      });
    }
  }
}
