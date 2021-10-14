import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import '/screen/profile/components/widgets/photo_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        elevation: 4,
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Align(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PhotoProfile(),
                Divider(
                  height: constraints.maxHeight * 0.03,
                  color: Colors.transparent,
                ),
                const TextFieldCustom(
                  label: "Nome",
                ),
                const TextFieldCustom(
                  label: "Bairro",
                ),
                const TextFieldCustom(
                  label: "Cidade",
                ),
                Divider(
                  height: constraints.maxHeight * 0.04,
                ),
                InkWell(
                  // onTap: _addOrEditController.invalidSendPressed,
                  child: Observer(builder: (_) {
                    return MaterialButton(
                      onPressed: () {}, // _addOrEditController.loginPressed,
                      child: Text(
                        "Enviar",
                        style: Fonts.fontsRoboto,
                      ),
                      color: Colors.blueGrey,
                      elevation: 6,
                      minWidth: constraints.maxWidth * 0.45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledColor: Colors.grey,
                      disabledElevation: 1,
                    );
                  }),
                ),
                const Divider(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
