import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/pages/hot_key/model/search_list_model.dart';
import 'package:flutter_sample/pages/hot_key/search_page_vm.dart';
import 'package:flutter_sample/routes/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
 final String? keyWord;
 const SearchPage({super.key, this.keyWord});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageViewModel viewModel = SearchPageViewModel();
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.keyWord);
    super.initState();
    viewModel.requestSearchList(keyWord: widget.keyWord);
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
          body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 2.r),
              _searchBar(
                valueChanged: (value) {
                  viewModel.requestSearchList(keyWord: value);
                },
                onTapCancel: () {
                  viewModel.clearSearchData();
                  _controller?.clear();
                },
                onTapFinish: () {
                  RouteUtil.pop(context);
                },
              ),
              _resultListView(
                itemClick: (value) {
                  RouteUtil.pushWebView(
                    context,
                    value?.link ?? "",
                    title: value?.title ?? "",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    )
    );
  }

  /// 搜索框
  Widget _searchBar({
    ValueChanged<String>? valueChanged,
    GestureTapCallback? onTapFinish,
    GestureTapCallback? onTapCancel,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 5.r, bottom: 5.r, left: 10.r, right: 10.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5.r),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTapFinish,
            child: Image.asset(
              "assets/images/icon_back.png",
              width: 30.r,
              height: 30.r,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.justify,
              style: titleTextStyle15,
              keyboardType: TextInputType.text,
              decoration: _inputDecoration(),
              textInputAction: TextInputAction.search,
              onSubmitted: valueChanged,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5.r,
              bottom: 5.r,
              left: 5.r,
              right: 10.r,
            ),
            child: InkWell(
              onTap: onTapCancel,
              child: Text("取消", style: blackTextStyle13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultListView({ValueChanged<SearchListItemModel?>? itemClick}) {
    return Selector<SearchPageViewModel, List<SearchListItemModel>?>(
      builder: (context, value, child) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _listItemView(
                value?[index].title ?? "",
                onTap: () {
                  itemClick?.call(value?[index]);
                },
              );
            },
            itemCount: value?.length ?? 0,
          ),
        );
      },
      selector: (context, vm) {
        return vm.dataSource;
      },
      shouldRebuild: (previous, next) {
        return true;
      },
    );
  }

  Widget _listItemView(String title, {GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15.r, bottom: 10.r, top: 10.r),
        width: double.infinity,
        child: Html(
          data: title,
          style: {
            "html": Style(fontSize: FontSize(15.sp), color: Colors.black),
          },
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10.r),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
      border: _inputBorder(),
    );
  }
}
