import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/modules/structure/widgets/navigation_url_widget.dart';
import 'package:wanandroid_flutter/modules/structure/widgets/structure_tree_widget.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key? key}) : super(key: key);

  @override
  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(child: Text("体系")),
            Tab(child: Text("导航")),
          ],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: TabBarView(
          controller: _tabController,
          children: const [
            StructureTreeWidget(),
            NavigationUrlWidget(),
          ],
        ),
      ),
    );
  }
}
