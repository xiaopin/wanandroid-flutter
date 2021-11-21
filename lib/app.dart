import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/modules/home/home_page.dart';
import 'package:wanandroid_flutter/modules/me/profile_page.dart';
import 'package:wanandroid_flutter/modules/project/project_page.dart';
import 'package:wanandroid_flutter/modules/structure/structure_page.dart';
import 'package:wanandroid_flutter/modules/weixin_official_account/weixin_official_account_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          body: PageView(
            children: const [
              HomePage(),
              ProjectPage(),
              WeixinOfficialAccountPage(),
              StructurePage(),
              ProfilePage()
            ],
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() => _currentPageIndex = index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: themeColor,
            selectedFontSize: 12,
            currentIndex: _currentPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.polymer_rounded),
                label: "项目",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_outlined),
                label: "公众号",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive),
                label: "体系",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "我的",
              )
            ],
            onTap: (int index) {
              setState(() {
                _currentPageIndex = index;
                _pageController.jumpToPage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
