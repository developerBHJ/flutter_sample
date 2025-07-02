import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/banner/banner_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

typedef BannerItemClick = Function(String title, String url);

abstract class BaseBannerController {
  void reloadData(bool loadData);
}

class BannerController extends BaseBannerController {
  HomePageBannerViewModel? viewModel;

  @override
  void reloadData(bool loadData) {
    viewModel?.requetBannerList();
  }

  void initState() {
    viewModel ??= HomePageBannerViewModel();
    viewModel?.requetBannerList();
  }

  void dispose() {
    viewModel?.dispose();
  }
}

class HomeBanner extends StatefulWidget {
  final BannerItemClick? itemClick;
  final BannerController? controller;

  const HomeBanner({this.controller, this.itemClick});

  @override
  State<StatefulWidget> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  void initState() {
    super.initState();
    widget.controller?.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.controller?.viewModel?.getStream(),
      initialData: widget.controller?.viewModel?.state,
      builder: (context, AsyncSnapshot<BannerModel> snapshot) {
        if (snapshot.data?.bannerList == null ||
            snapshot.data?.bannerList?.isEmpty == true) {
          return SizedBox(height: 20.r);
        }
        return Container(
          width: double.infinity,
          height: 150.r,
          margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.w),
          child: Swiper(
            itemCount: snapshot.data?.bannerList?.length ?? 0,
            indicatorLayout: PageIndicatorLayout.NONE,
            autoplayDelay: 3000,
            duration: 800,
            autoplay: true,
            pagination: SwiperPagination(
              margin: EdgeInsets.all(5.r),
              builder: DotSwiperPaginationBuilder(
                size: 8.r,
                color: Colors.grey,
                activeColor: Colors.blueAccent,
              ),
            ),
            autoplayDisableOnInteraction: false,
            onTap: (index) {
              var url = snapshot.data?.bannerList?[index]?.url ?? "";
              var title = snapshot.data?.bannerList?[index]?.title ?? "";
              widget.itemClick?.call(title, url);
            },
            itemBuilder: (context, index) {
              var imageUrl = snapshot.data?.bannerList?[index]?.imagePath ?? "";
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}
