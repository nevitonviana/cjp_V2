import 'package:cjp_v2/screen/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import '/screen/profile/components/widgets/photo_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = ProfileController();
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
                PhotoProfile(
                  height: constraints.maxHeight,
                  profileController: profileController,
                ),
                Divider(
                  height: constraints.maxHeight * 0.03,
                  color: Colors.transparent,
                ),
                Observer(builder: (_) {
                  return TextFieldCustom(
                    onChanged: profileController.setName,
                    errorText: profileController.nameError,
                    label: "Nome",
                  );
                }),
                Observer(builder: (_) {
                  return TextFieldCustom(
                    onChanged: profileController.setDistrict,
                    errorText: profileController.districtError,
                    label: "Bairro",
                  );
                }),
                Observer(builder: (_) {
                  return TextFieldCustom(
                    onChanged: profileController.setCity,
                    errorText: profileController.cityError,
                    label: "Cidade",
                  );
                }),
                Divider(
                  height: constraints.maxHeight * 0.04,
                ),
                InkWell(
                  onTap: profileController.invalidSendPressed,
                  child: Observer(builder: (_) {
                    return MaterialButton(
                      onPressed: profileController.profilePressed,
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
