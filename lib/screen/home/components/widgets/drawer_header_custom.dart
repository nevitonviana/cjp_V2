import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';

class DrawerHeaderCustom extends StatelessWidget {
  const DrawerHeaderCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _controller = GetIt.I<UserController>();
    return Center(
      child: UserAccountsDrawerHeader(
        arrowColor: Colors.black,
        accountName: Text(_controller.user!.name),
        accountEmail: const Text("Centro de aJuda á População"),
        currentAccountPicture: CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            _controller.user!.photoUrl.isNotEmpty
                ? _controller.user!.photoUrl
                : "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392",
            scale: 20,
          ),
        ),
      ),
    );
  }
}
