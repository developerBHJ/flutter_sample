import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_children.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_detail_vm.dart';
import 'package:flutter_sample/pages/knowledge/model/Knowledge_detail_param.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class KnowledgeDetailTabPage extends StatefulWidget {
  final List<KnowledgeDetailParam> items;
  final String title;
  const KnowledgeDetailTabPage({
    super.key,
    required this.items,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() => _KnowledgeDetailTabPageState();
}

class _KnowledgeDetailTabPageState extends State<KnowledgeDetailTabPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  KnowledgeDetailViewModel viewModel = KnowledgeDetailViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initTabs(widget.items);
    _tabController = TabController(
      length: viewModel.tabList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            padding: EdgeInsets.all(0),
            tabs: viewModel.tabList,
            controller: _tabController,
            isScrollable: true,
            labelStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            indicatorColor: Colors.redAccent,
            indicatorWeight: 1.r,
          ),
        ),
        body: SafeArea(
          child: TabBarView(controller: _tabController, children: _children()),
        ),
      ),
    );
  }

  List<Widget> _children() {
    return widget.items
        .map((element) => KnowledgeDetailChildPage(param: element))
        .toList();
  }
}
