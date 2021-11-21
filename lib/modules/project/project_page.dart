import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/project/widgets/project_article_widget.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<ProjectCategoryModel> categories = [];
  late TabController _tabController;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestProjectCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(backgroundColor: themeColor),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: categories
              .map<Tab>((item) => Tab(child: Text(item.name ?? "")))
              .toList(),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories
            .map<Widget>((item) => ProjectArticleWidget(category: item))
            .toList(),
      ),
      backgroundColor: backgroundColor,
    );
  }

  requestProjectCategories() {
    Api.getProjectCategories().then((value) {
      setState(() {
        _tabController = TabController(length: value.length, vsync: this);
        categories = value;
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
