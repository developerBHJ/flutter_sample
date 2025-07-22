import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_sample/pages/home_page/model/home_list_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageItem extends StatefulWidget {
  final HomeListItemData? model;
  final GestureTapCallback? itemCompletion;
  final GestureTapCallback? imageCompletion;

  const HomePageItem({this.model, this.itemCompletion, this.imageCompletion});

  @override
  State<StatefulWidget> createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  Widget build(BuildContext context) {
    return _ItemBuilder(context);
  }

  Widget _ItemBuilder(BuildContext context) {
    return GestureDetector(
      onTap: widget.itemCompletion,
      child: Container(
        margin: EdgeInsets.only(left: 10.w, top: 5.w, right: 10.w, bottom: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          border: Border.all(color: Colors.black26),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.asset(
                    "assets/images/luoxiaohei.png",
                    width: 25.r,
                    height: 25.r,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 5.r),
                normalText(widget.model?.author ?? ""),
                const Expanded(child: SizedBox()),
                normalText(widget.model?.niceDate),
                SizedBox(width: 10.r),
                Text(
                  widget.model?.type == 1 ? "置顶" : "",
                  style: TextStyle(fontSize: 15.sp, color: Colors.blueAccent),
                ),
              ],
            ),
            SizedBox(height: 5.r),
            Text(widget.model?.title ?? "", style: titleTextStyle15),
            SizedBox(height: 5.r),
            Row(
              children: [
                Text(
                  widget.model?.chapterName ?? "",
                  style: TextStyle(fontSize: 13.sp, color: Colors.green),
                ),
                const Expanded(child: SizedBox()),
                collectedImage(
                  widget.model?.collect ?? false,
                  onTap: widget.imageCompletion,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
