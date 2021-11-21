import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:wanandroid_flutter/models/home_banner_model.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';
import 'package:wanandroid_flutter/widgets/network_placeholder_image.dart';

class HomeBannerWidget extends StatefulWidget {
  List<HomeBannerModel> data;
  HomeBannerWidget({Key? key, required this.data}) : super(key: key);

  @override
  _HomeBannerWidgetState createState() => _HomeBannerWidgetState(data);
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  List<HomeBannerModel> data;

  _HomeBannerWidgetState(this.data);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        // return Image.network(
        //   data[index].imagePath!,
        //   fit: BoxFit.cover,
        // );
        String url = data[index].imagePath ?? "";
        return NetworkPlaceholderImage(url: url, fit: BoxFit.cover);
      },
      itemCount: data.length,
      onTap: (int index) {
        var item = data[index];
        var url = item.url ?? "";
        if (url.isEmpty) return;
        var route = MaterialPageRoute(
          builder: (BuildContext context) => WebViewPage(
            url: url,
            title: item.title,
          ),
        );
        Navigator.push(context, route);
      },
      pagination: const SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: themeColor,
        ),
        alignment: Alignment.bottomRight,
      ),
      // control: const SwiperControl(),
      autoplay: true,
    );
  }
}
