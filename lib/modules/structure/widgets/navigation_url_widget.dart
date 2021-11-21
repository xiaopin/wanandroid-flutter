import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/webview_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

/// 常用网站导航
class NavigationUrlWidget extends StatefulWidget {
  const NavigationUrlWidget({Key? key}) : super(key: key);

  @override
  _NavigationUrlWidgetState createState() => _NavigationUrlWidgetState();
}

class _NavigationUrlWidgetState extends State<NavigationUrlWidget>
    with AutomaticKeepAliveClientMixin {
  List<NavigationTreeModel> trees = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestTree();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        NavigationTreeModel model = trees[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10.0, top: 16.0),
              child: Text(
                model.name ?? "",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Wrap(
              spacing: 10.0,
              children: (model.articles ?? []).map<Widget>((item) {
                if (item.link != null) {
                  item.link = item.link!.replaceAll(RegExp(r"\n$"), "");
                }
                return ActionChip(
                  backgroundColor: backgroundColor,
                  label: Text(item.title ?? ""),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => WebViewPage(
                          url: item.link ?? "",
                          title: item.title,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
      itemCount: trees.length,
    );
  }

  requestTree() {
    Api.getNavigationTrees().then((value) {
      setState(() {
        trees = value;
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
