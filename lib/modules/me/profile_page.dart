import 'package:flutter/material.dart';
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
      body: ClipPath(
        clipper: BottomClipper(),
        child: Container(
          color: themeColor,
          width: double.infinity,
          height: 200,
          child: Icon(
            Icons.person,
            size: 60,
          ),
        ),
      ),
    );
  }
}
