import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';
import '../../../../../route_generate.dart';
import 'drawer_header_custom.dart';
import 'menu_button_custom.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final UserController _userController = GetIt.I<UserController>();

  @override
  void initState() {
    super.initState();
    autorun((_) {
      if (_userController.loadingSingOut) {
        Navigator.pushReplacementNamed(context, RouteGenerate.routeLogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        right: Radius.circular(50),
      ),
      child: Drawer(
        elevation: 6,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const DrawerHeaderCustom(),
              MenuButtonCustom(
                onTap: () => Navigator.pushNamed(
                    context, RouteGenerate.routeAddOccurrence),
                text: "Adicionar Ocorrência",
                icons: Icons.note_alt_outlined,
              ),
              MenuButtonCustom(
                text: "Minhas Ocorrências",
                icons: Icons.list_alt_rounded,
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteGenerate.routeMyOccurrence,
                ),
              ),
              if (_userController.user!.isLogin == "firebase")
                MenuButtonCustom(
                  text: "Perfil",
                  icons: Icons.person,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteGenerate.routeProfile,
                  ),
                ),
              MenuButtonCustom(
                text: "FeedBack",
                icons: Icons.feedback_outlined,
                onTap: () =>
                    Navigator.pushNamed(context, RouteGenerate.routeFeedback),
              ),
              MenuButtonCustom(
                onTap: () async {
                  await _userController.signOut();
                },
                text: "Sair",
                icons: Icons.exit_to_app_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
