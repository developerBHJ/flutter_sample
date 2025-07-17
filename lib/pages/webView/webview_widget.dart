import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_sample/common_ui/loading.dart';

///需要加载的内容类型
enum WebViewType {
  //html文本
  HTMLTEXT,
  //链接
  URL
}

///定义js通信回调方法
typedef dynamic JsChannelCallback(List<dynamic> arguments);

class WebViewWidget extends StatefulWidget{

  /// 加载内容，可以是URL也可以是html
  final String loadresource;
  /// 加载内容的类型
  final WebViewType? type;
  /// 是否需要清除缓存
  final bool? clearCache;
  /// 与js通信的channel集合
  final Map<String, JsChannelCallback>? jsChannelMapl;

  final Function(InAppWebViewController controller)? onWebViewCreated;

  const WebViewWidget({super.key, required this.loadresource, this.type, this.clearCache, this.jsChannelMapl, this.onWebViewCreated});


@override
  State<StatefulWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget>{

late InAppWebViewController webViewController;
final GlobalKey webViewKey = GlobalKey();

InAppWebViewSettings settings = InAppWebViewSettings(
  /// 跨平台
// useShouldOverrideUrlLoading: true,
mediaPlaybackRequiresUserGesture: false,
/// 不允许缩放
builtInZoomControls: false,
//支持HybridComposition
useHybridComposition: true,
allowsInlineMediaPlayback: true 
);

@override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Loading.dismissAll();
  }


  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialSettings: settings,
      onWebViewCreated: (controller){
        webViewController = controller;
        if(widget.clearCache == true){
          InAppWebViewController.clearAllCache();
        }
        if(widget.onWebViewCreated == null){
          if (widget.type == WebViewType.HTMLTEXT){
            webViewController.loadData(data: widget.loadresource);
          }else if(widget.type == WebViewType.URL){
            webViewController.loadUrl(urlRequest: URLRequest(url: WebUri(widget.loadresource)));
          }
        }else{
          widget.onWebViewCreated?.call(controller);
        }
        // 注册JS
        widget.jsChannelMapl?.forEach((handleName,callBack){
          webViewController.addJavaScriptHandler(handlerName: handleName, callback: callBack);
        });
      },
      onConsoleMessage: (controller, consoleMessage) {
          log("consoleMessage ====来自于js的打印==== \n $consoleMessage");
      },
      onProgressChanged: (controller, progress) {
          log("加载进度：$progress");
      },
      onLoadStart: (controller, url) {
        Loading.showLoading(duration: Duration(seconds: 45));
      },
      onReceivedError: (controller, request, error) {
        Loading.dismissAll();
        log("加载失败：$error");
      },
      onLoadStop: (controller, url) {
                Loading.dismissAll();
      },
      onPageCommitVisible: (controller, url) {
        
      },
      onReceivedServerTrustAuthRequest:(controller, challenge) async {
        return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
      },
    );
  }
}