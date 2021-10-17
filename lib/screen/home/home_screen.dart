import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';
import 'components/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController _controller = GetIt.I<UserController>();
  String a = "teste";
  int b = 1236;

  aa() async {
    // _controller.user?.isLogin == "firebase"
    //     ? print("145236")
    //     : print("111111111");
    //
    // _controller.user!.isLogin.contains("firebase")
    //     ? print("ttt145236")
    //     : print("tttt111111111");
  }

  @override
  void initState() {
    aa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "CJP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Text(_controller.user?.name ?? "000"),
      ),
    );
  }
}
