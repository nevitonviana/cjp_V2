import 'package:cjp_v2/components/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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

  aa() {
    // if (a != String) {
    //   print(11111);
    //   print(b);
    // }
    // if (a == String) {
    //   print(2222222222);
    //   print(a);
    // }
    // print(a.runtimeType);
    // print(_controller.user?.photoUrl);
    // print(_controller.user!.photoUrl.runtimeType);
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
