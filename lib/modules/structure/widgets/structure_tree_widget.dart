import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/structure/structure_articles_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

/// 体系列表数据展示
class StructureTreeWidget extends StatefulWidget {
  const StructureTreeWidget({Key? key}) : super(key: key);

  @override
  _StructureTreeWidgetState createState() => _StructureTreeWidgetState();
}

class _StructureTreeWidgetState extends State<StructureTreeWidget>
    with AutomaticKeepAliveClientMixin {
  List<StructureTreeModel> trees = [];

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
        StructureTreeModel model = trees[index];
        List<StructureTreeModel> childrenModels = model.children ?? [];
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
              children: buildActionChip(model),
            ),
          ],
        );
      },
      itemCount: trees.length,
    );
  }

  List<Widget> buildActionChip(StructureTreeModel model) {
    List<StructureTreeModel> childrenModels = model.children ?? [];
    return List.generate(
      childrenModels.length,
      (index) {
        return ActionChip(
          backgroundColor: backgroundColor,
          label: Text(childrenModels[index].name ?? ""),
          onPressed: () {
            var route = MaterialPageRoute(
              builder: (context) => StructureArticlesPage(
                model: model,
                initialIndex: index,
              ),
            );
            Navigator.push(context, route);
          },
        );
      },
    );
  }

  requestTree() {
    Api.getStructureTrees().then((value) {
      setState(() {
        trees = value;
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
