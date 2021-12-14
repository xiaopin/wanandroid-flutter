import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        backgroundColor: themeColor,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 98,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => username = value,
                  ),
                  TextField(
                    onChanged: (value) => password = value,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 24,
            ),
            TextButton(
              child: const Text("登录"),
              onPressed: () {
                print("username:$username, password:$password");
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => themeColor),
                foregroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Text(
                    "没有账号？去注册",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    print('注册');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
