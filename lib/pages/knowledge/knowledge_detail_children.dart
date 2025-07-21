import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/common_ui/smart_refresh_widget.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_vm.dart';
import 'package:flutter_sample/pages/knowledge/model/Knowledge_detail_param.dart';
import 'package:flutter_sample/pages/knowledge/model/knowledge_detail_item.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KnowledgeDetailChildPage extends StatefulWidget {
  final KnowledgeDetailParam param;
  const KnowledgeDetailChildPage({super.key, required this.param});

  @override
  State<StatefulWidget> createState() => _KnowledgeDetailChildPageState();
}

class _KnowledgeDetailChildPageState extends State<KnowledgeDetailChildPage> {
  final RefreshController _controller = RefreshController(
    initialRefresh: false,
  );

  KnowledgeDetailViewModel viewModel = KnowledgeDetailViewModel();

  @override
  void initState() {
    super.initState();
    reloadData(false);
  }

  void reloadData(bool loadMore) {
    viewModel.requestDetailList(widget.param.id, loadMore).then((value) {
      if (loadMore) {
        _controller.loadComplete();
      } else {
        _controller.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<KnowledgeDetailViewModel>(
          builder: (context, value, child) {
            return SmartRefreshWidget(
              controller: _controller,
              onLoading: () {
                reloadData(true);
              },
              onRefresh: () {
                reloadData(false);
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  KnowledgeDetailItem model = value.items[index];
                  return _listViewItem(
                    model,
                    onTap: () {
                      if (model.link?.isNotEmpty == true) {
                        RouteUtil.pushWebView(context, model.link ?? "");
                      }
                    },
                  );
                },
                itemCount: value.items.length,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _listViewItem(KnowledgeDetailItem model, {GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 12.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                normalText(model.superChapterName),
                Expanded(child: SizedBox()),
                Text(model.niceShareDate ?? ""),
              ],
            ),
            Text(model.title ?? "", style: titleTextStyle15),
            Row(
              children: [
                normalText(model.chapterName),
                Expanded(child: SizedBox()),
                Text(model.shareUser ?? ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
