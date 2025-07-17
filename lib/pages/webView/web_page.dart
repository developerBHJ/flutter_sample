import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_sample/app.dart';
import 'package:flutter_sample/pages/webView/webview_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebPage extends StatefulWidget{

  /// 加载内容，可以是URL也可以是html
  final String loadresource;
    //是否显示标题
  final String? title;
  /// 标题
  final WebViewType? type;
  /// 是否需要清除缓存
  final bool? clearCache;
  /// 与js通信的channel集合
  final Map<String, JsChannelCallback>? jsChannelMapl;

  const WebPage({super.key, required this.loadresource,this.title, this.type, this.clearCache, this.jsChannelMapl});


@override
  State<StatefulWidget> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (widget.title?.isNotEmpty == true) ? AppBar(title:_buildAppBarTitle(widget.title ?? "")) : AppBar(title: SizedBox(),),
      body: SafeArea(child: WebViewWidget(loadresource: widget.loadresource,type: widget.type,jsChannelMapl: widget.jsChannelMapl,)),
    );
  }

  Widget _buildAppBarTitle(String title){
    return Html(data: title,style: {
      // 整体使用 html样式
      "html": Style(fontSize: FontSize(15.sp))
    },);
  }
}