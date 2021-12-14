import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/api/http.dart';
import 'package:wanandroid_flutter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Http.cookieDirectoryPath = await getCookieDirectoryPath();
  runApp(const App());
}
