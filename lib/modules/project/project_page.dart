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
        title: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 0,
                  value: 0,
                  isExpanded: false,
                  isDense: true,
                  dropdownColor: themeColor,
                  items: List.generate(
                    categories.length,
                    (index) {
                      var model = categories[index];
                      return DropdownMenuItem(
                        value: index,
                        child: Text(
                          model.name ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
                  onChanged: (value) {
                    num n = value! as num;
                    int index = n.toInt();
                    setState(() => _tabController.animateTo(index));
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 40),
              color: themeColor,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: List.generate(
                  categories.length,
                  (index) => Tab(child: Text(categories[index].name ?? "")),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          categories.length,
          (index) => ProjectArticleWidget(category: categories[index]),
        ),
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
