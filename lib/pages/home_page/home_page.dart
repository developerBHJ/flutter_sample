import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/banner/home_banner.dart';
import 'package:flutter_sample/pages/home_page/widget/home_page_item.dart';
import 'package:flutter_sample/pages/home_page/home_page_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var viewModel = HomePageViewModel();
  BannerController? bannerController = BannerController();
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
    viewModel.requestListData(false);
  }

  /// 下拉刷新/上拉加载
  void refreshOrLoadMore(bool loadMore) {
    viewModel.requestListData(
      loadMore,
      completion: (value) {
        if (loadMore) {
          _refreshController.loadComplete();
        } else {
          _refreshController.refreshCompleted();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      builder: (BuildContext context, Widget? widget) {
        return Scaffold(
          appBar: AppBar(title: Text("首页")),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SmartRefresher(
              controller: _refreshController,
              onLoading: () {
                refreshOrLoadMore(true);
              },
              onRefresh: () {
                refreshOrLoadMore(false);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeBanner(
                      controller: bannerController,
                      itemClick: (title, url) {
                        print("title=$title  url=$url");
                      },
                    ),
                    _listView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _listView() {
    return Consumer<HomePageViewModel>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),


          itemBuilder: (context, index) {
            return HomePageItem(
              model: viewModel.listData?[index],
              itemCompletion: () => {},
              imageCompletion: () => {},
            );
          },
          itemCount: viewModel.listData?.length ?? 0,
        );
      },
    );
  }
}
