import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid_flutter/api/api.dart';
import 'package:wanandroid_flutter/models/index.dart';
import 'package:wanandroid_flutter/modules/weixin_official_account/widgets/weixin_article_widget.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class WeixinOfficialAccountPage extends StatefulWidget {
  const WeixinOfficialAccountPage({Key? key}) : super(key: key);

  @override
  _WeixinOfficialAccountPageState createState() =>
      _WeixinOfficialAccountPageState();
}

class _WeixinOfficialAccountPageState extends State<WeixinOfficialAccountPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<OfficialAccountModel> accounts = [];
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestWeixinOfficialAccounts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (accounts.isEmpty) {
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
                    accounts.length,
                    (index) {
                      var model = accounts[index];
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
                tabs: accounts
                    .map<Tab>((item) => Tab(child: Text(item.name ?? "")))
                    .toList(),
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
        children: accounts
            .map<Widget>((item) => WeixinArticleWidget(account: item))
            .toList(),
      ),
      backgroundColor: backgroundColor,
    );
  }

  requestWeixinOfficialAccounts() {
    Api.getWeixinOfficialAccounts().then((value) {
      setState(() {
        _tabController = TabController(length: value.length, vsync: this);
        accounts = value;
      });
    }).catchError((error) {
      showToast(error.toString());
    });
  }
}
