import 'dart:async';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';
import '../../route_generate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController _userController = GetIt.I<UserController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(
      const Duration(seconds: 2),
      () async {
        if (_userController.user != null) {
          Navigator.pushReplacementNamed(context, RouteGenerate.routeHome);
        } else {
          Navigator.pushReplacementNamed(context, RouteGenerate.routeLogin);
        }
      },
    );
  }

  final _commonColor = Colors.white;
  final _accentColor = Colors.yellow;
  final _fontSizeCommon = 18.0;
  final _fontSizeAccent = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2f4971),
      body: Center(
        child: Entry.opacity(
          duration: const Duration(seconds: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seja Bem-Vindo ",
                style:
                    TextStyle(color: _commonColor, fontSize: _fontSizeCommon),
              ),
              const Divider(height: 10),
              Text(
                "ao",
                style:
                    TextStyle(color: _commonColor, fontSize: _fontSizeCommon),
              ),
              const Divider(height: 10),
              Text.rich(
                TextSpan(
                  text: "C",
                  style:
                      TextStyle(color: _accentColor, fontSize: _fontSizeAccent),
                  children: [
                    TextSpan(
                      text: "entro de a",
                      style: TextStyle(
                          color: _commonColor, fontSize: _fontSizeCommon),
                    ),
                    TextSpan(
                      text: "J",
                      style: TextStyle(
                          color: _accentColor, fontSize: _fontSizeAccent),
                    ),
                    TextSpan(
                      text: "uda á ",
                      style: TextStyle(
                          color: _commonColor, fontSize: _fontSizeCommon),
                    ),
                    TextSpan(
                      text: "P",
                      style: TextStyle(
                          color: _accentColor, fontSize: _fontSizeAccent),
                    ),
                    TextSpan(
                      text: "opulação",
                      style: TextStyle(
                          color: _commonColor, fontSize: _fontSizeCommon),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
