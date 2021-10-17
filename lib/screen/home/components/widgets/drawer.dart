import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';
import '../../../../route_generate.dart';
import 'drawer_header_custom.dart';
import 'menu_button_custom.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = GetIt.I<UserController>();
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
                text: "Adicionar Ocorrencia",
                icons: Icons.note_alt_outlined,
              ),
              MenuButtonCustom(
                text: "Minhas Ocorrencias",
                icons: Icons.list_alt_rounded,
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteGenerate.routeMyOccurrence,
                ),
              ),
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
              Observer(builder: (_) {
                return MenuButtonCustom(
                  onTap: () async {
                    await _userController.signOut();
                    if (_userController.loadingSingOut) {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerate.routeLogin);
                    }
                  },
                  text: "Sair",
                  icons: Icons.exit_to_app_outlined,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
