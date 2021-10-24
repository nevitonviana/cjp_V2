import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';
import '../../route_generate.dart';
import 'components/widgets/text_animated.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final UserController _userController = GetIt.I<UserController>();
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<double> _animation2;

  final _commonColor = Colors.white;
  final _accentColor = Colors.yellow;
  final _fontSizeCommon = 18.0;
  final _fontSizeAccent = 25.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(end: 80, begin: 0.9).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.4, 1, curve: Curves.easeOutBack),
    ));
    _animation2 = Tween<double>(end: 50, begin: 0.9).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.4, 1, curve: Curves.easeOutBack),
    ));
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(
      const Duration(seconds: 4),
      () async {
        if (_userController.user != null) {
          Navigator.pushReplacementNamed(context, RouteGenerate.routeHome);
        } else {
          Navigator.pushReplacementNamed(context, RouteGenerate.routeLogin);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2f4971),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seja Bem-Vindo ",
              style: TextStyle(color: _commonColor, fontSize: _fontSizeCommon),
            ),
            const Divider(height: 10),
            Text(
              "ao",
              style: TextStyle(color: _commonColor, fontSize: _fontSizeCommon),
            ),
            const Divider(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "C",
                  style: TextStyle(
                    color: _accentColor,
                    fontSize: _fontSizeAccent,
                  ),
                ),
                TextAnimated(animation: _animation, text: "entro de a"),
                Text(
                  "J",
                  style: TextStyle(
                    color: _accentColor,
                    fontSize: _fontSizeAccent,
                  ),
                ),
                TextAnimated(animation: _animation2, text: "uda á "),
                Text(
                  "P",
                  style: TextStyle(
                    color: _accentColor,
                    fontSize: _fontSizeAccent,
                  ),
                ),
                TextAnimated(animation: _animation, text: "opulação"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
