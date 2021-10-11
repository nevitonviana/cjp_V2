import 'package:flutter/material.dart';

import 'drawer_header_custom.dart';
import 'menu_button_custom.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
            children: const [
              DrawerHeaderCustom(),
              MenuButtonCustom(
                // onTap: () => Navigator.pushNamed(
                //     context, RouteGenerate.route_adicionarOcorrencia),
                text: "Adicionar Ocorrencia",
                icons: Icons.note_alt_outlined,
              ),
              MenuButtonCustom(
                text: "Minhas Ocorrencias",
                icons: Icons.list_alt_rounded,
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   RouteGenerate.route_Minhas_Ocorrencias,
                // ),
              ),
              MenuButtonCustom(
                text: "Pefil",
                icons: Icons.person,
                // onTap: () =>
                //     Navigator.pushNamed(context, RouteGenerate.route_Perfil),
              ),
              MenuButtonCustom(
                text: "FeedBack",
                icons: Icons.feedback_outlined,
                // onTap: () =>
                //     Navigator.pushNamed(context, RouteGenerate.route_FeedBack),
              ),
              MenuButtonCustom(
                // onTap: () => _signOut(),
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
