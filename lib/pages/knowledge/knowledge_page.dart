import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/smart_refresh_widget.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_tab.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_vm.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_model.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<StatefulWidget> createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  KnowledgeViewModel viewModel = KnowledgeViewModel();
  final RefreshController _controller = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
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
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SmartRefreshWidget(
            controller: _controller,
            enablePullUp: false,
            onRefresh: () {
              viewModel.reloadData(
                completion: () {
                  _controller.refreshCompleted();
                },
              );
            },
            child: _listView(),
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return Consumer<KnowledgeViewModel>(
      builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            KnowledgeModel? model = value.dataSource?[index];
            return _listViewItem(
              model,
              itemClick: () {
                if (model?.detailParams()?.isNotEmpty == true) {
                  RouteUtil.push(
                    context,
                    KnowledgeDetailTabPage(items: model?.detailParams() ?? [],title: model?.name ?? "",),
                  );
                }
              },
            );
          },
          itemCount: value.dataSource?.length ?? 0,
        );
      },
    );
  }

  Widget _listViewItem(KnowledgeModel? model, {GestureTapCallback? itemClick}) {
    return GestureDetector(
      onTap: itemClick,
      child: Container(
        margin: EdgeInsets.only(left: 12.r, right: 12.r, top: 12.r),
        padding: EdgeInsets.only(
          left: 12.r,
          right: 10.r,
          top: 10.r,
          bottom: 10.r,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.r),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model?.name ?? "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    model?.subTitle() ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 14.r),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.r),
            Image.asset(
              "assets/images/img_arrow_right.png",
              width: 24.r,
              height: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}
