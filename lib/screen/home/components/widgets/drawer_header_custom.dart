import 'package:flutter/material.dart';

class DrawerHeaderCustom extends StatelessWidget {
  const DrawerHeaderCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UserAccountsDrawerHeader(
        arrowColor: Colors.black,
        accountName: Text("_nome"),
        accountEmail: Text("Centro de aJuda á População"),
        currentAccountPicture: CircleAvatar(
          radius: 55,
          // backgroundImage: NetworkImage("_fotoPerfil", scale: 20),
        ),
      ),
    );
  }
}
