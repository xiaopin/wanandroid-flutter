import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wanandroid_flutter/modules/login_page.dart';
import 'package:wanandroid_flutter/utils/constants.dart';
import 'package:wanandroid_flutter/widgets/bottom_clipper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: themeColor,
              width: double.infinity,
              height: 200,
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 60,
                      color: Color.fromARGB(255, 53, 53, 53),
                    ),
                    Text(
                      "请登录",
                      style: TextStyle(
                        color: Color.fromARGB(255, 53, 53, 53),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ),
          ProfileTableCell(
            title: "收藏",
            leading: const Icon(Icons.favorite_border),
            onTap: () => print("点击了设置"),
          ),
          ProfileTableCell(
            title: "设置",
            leading: const Icon(Icons.settings_outlined),
            onTap: () => print("点击了设置"),
          ),
          ProfileTableCell(
            title: "意见反馈",
            leading: const Icon(Icons.feedback_outlined),
            onTap: sendEmail,
          ),
        ],
      ),
    );
  }

  sendEmail() async {
    var url =
        'mailto:pincheng23@hotmail.com?subject=WanAndroid%20Flutter%20Feedback&body=feedback';
    if (await canLaunch(url)) {
      launch(url);
    } else {
      showToast("未找到邮件App，请通过GitHub issue提交反馈");
      await Future.delayed(const Duration(seconds: 2));
      launch('https://github.com/xiaopin/wanandroid-flutter',
          forceSafariVC: false);
    }
  }
}

class ProfileTableCell extends StatelessWidget {
  final String title;
  final Widget? leading;
  final GestureTapCallback? onTap;

  const ProfileTableCell(
      {Key? key, required this.title, this.leading, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(5.0, 0.5, 5.0, 0.5),
        color: Colors.white,
        child: ListTile(
          title: Text(title),
          leading: leading,
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
          ),
        ),
      ),
      onTap: onTap,
      // onTap: () => print("点击了设置"),
    );
  }
}
