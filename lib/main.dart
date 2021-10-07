import 'package:cjp_v2/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

import '/components/theme_date/theme_date.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CJP',
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
