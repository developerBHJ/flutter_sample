import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/common_ui/smart_refresh_widget.dart';
import 'package:flutter_sample/pages/my_collectes/model/my_collect_model.dart';
import 'package:flutter_sample/pages/my_collectes/my_collect_vm.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCollectPage extends StatefulWidget {
  const MyCollectPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyCollectPageState();
}

class _MyCollectPageState extends State<MyCollectPage> {
  MyCollectViewModel viewModel = MyCollectViewModel();
  final RefreshController _controller = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    viewModel.reloadData(false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("我的收藏")),
        body: SafeArea(
          child: Selector<MyCollectViewModel, List<MyCollectListModel>>(
            builder: (context, value, child) {
              return SmartRefreshWidget(
                controller: _controller,
                onLoading: () {
                  viewModel.reloadData(true).then((value) {
                    _controller.loadComplete();
                  });
                },
                onRefresh: () {
                  viewModel.reloadData(true).then((value) {
                    _controller.refreshCompleted();
                  });
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    MyCollectListModel model = value[index];
                    return _listItemView(
                      model,
                      itemClick: () {
                        if (model.link?.isNotEmpty == true) {
                          RouteUtil.pushWebView(
                            context,
                            model.link ?? "",
                            title: model.title,
                          );
                        }
                      },
                      imageCompletion: () {
                        viewModel.requestCancelCollect("${model.id}", "${model.originId}");
                      },
                    );
                  },
                  itemCount: viewModel.dataSource.length,
                ),
              );
            },
            selector: (context, value) {
              return value.dataSource;
            },
            shouldRebuild: (previous, next) {
              return true;
            },
          ),
        ),
      ),
    );
  }

  Widget _listItemView(
    MyCollectListModel model, {
    GestureTapCallback? itemClick,
    GestureTapCallback? imageCompletion,
  }) {
    return GestureDetector(
      onTap: itemClick,
      child: Container(
        margin: EdgeInsets.only(left: 12.r, right: 12.r, top: 12.r),
        padding: EdgeInsets.only(
          top: 10.r,
          bottom: 10.r,
          left: 12.r,
          right: 12.r,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text("作者：${model.author ?? ""}")),
                Text("时间：${model.niceDate}"),
              ],
            ),
            SizedBox(height: 8.r),
            Text(model.title ?? "", style: titleTextStyle15),
            Row(
              children: [
                Expanded(child: Text(model.chapterName ?? "")),
                collectedImage(true, onTap: imageCompletion),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
