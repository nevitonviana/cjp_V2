import 'package:flutter/material.dart';

import 'components/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future a() async {
  //   const List a = ["teste", "asas"];
  //   const List b = [123, 2555];
  //   return {'aa': a, 'bb': b};
  // }
  //
  // b() async {
  //   final f = await a().then((value) {
  //     print("aaaaaaaaaaaa");
  //     print(value);
  //     print("aaaaaaaaaaaa");
  //   });
  //
  //   print(f);
  //   print(f['aa']);
  // }

  @override
  void initState() {
    // b();
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
    );
  }
}
