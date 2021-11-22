import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/structure/widgets/structure_article_widget.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class StructureArticlesPage extends StatelessWidget {
  final StructureTreeModel model;
  final int initialIndex;
  const StructureArticlesPage(
      {Key? key, required this.model, required this.initialIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StructureTreeModel> childrenModels = model.children ?? [];
    return DefaultTabController(
      length: childrenModels.length,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.name ?? ""),
          backgroundColor: themeColor,
          bottom: TabBar(
            tabs: List.generate(
              childrenModels.length,
              (index) => Tab(child: Text(childrenModels[index].name ?? "")),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: List.generate(
            childrenModels.length,
            (index) => StructureArticleWidget(
                cid: childrenModels[index].id?.toInt() ?? 0),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

// class StructureArticlesPage extends StatefulWidget {
//   final StructureTreeModel model;
//   const StructureArticlesPage({Key? key, required this.model})
//       : super(key: key);
//
//   @override
//   _StructureArticlesPageState createState() =>
//       _StructureArticlesPageState(model);
// }

// class _StructureArticlesPageState extends State<StructureArticlesPage>
//     with SingleTickerProviderStateMixin {
//   final StructureTreeModel model;
//   late TabController _tabController;
//
//   _StructureArticlesPageState(this.model);
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         TabController(length: model.children?.length ?? 0, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<StructureTreeModel> childrenModels = model.children ?? [];
//     return DefaultTabController(
//       // initialIndex: 2,
//       length: childrenModels.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(model.name ?? ""),
//           backgroundColor: themeColor,
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: List.generate(
//               childrenModels.length,
//               (index) => Tab(child: Text(childrenModels[index].name ?? "")),
//             ),
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorColor: Colors.white,
//             labelColor: Colors.white,
//             isScrollable: true,
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: List.generate(
//             childrenModels.length,
//             (index) => Center(
//               child: Text(childrenModels[index].name ?? ""),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
