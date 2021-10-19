import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '/components/widgets/widgets.dart';
import 'controller/account_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final AccountController _accountController = AccountController();

  @override
  void initState() {
    super.initState();
    autorun((_) {
      if (_accountController.errorMessage != null) {
        ErrorDialog().error(
          context: context,
          error: _accountController.errorMessage!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            elevation: 2,
            backgroundColor: Colors.grey[300],
            title: const Text(
              "Cadastro",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Align(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setName,
                        errorText: _accountController.nameError,
                        label: "Nome Completo",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setDistrict,
                        errorText: _accountController.districtError,
                        label: "Bairro",
                        prefixIcon: const Icon(
                          Icons.house_sharp,
                          color: Colors.black87,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setCity,
                        errorText: _accountController.cityError,
                        label: "Cidade",
                        prefixIcon: const Icon(
                          Icons.location_city_sharp,
                          color: Colors.black87,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setEmail,
                        errorText: _accountController.errorEmail,
                        label: "E-mail",
                        prefixIcon: const Icon(
                          Icons.email_sharp,
                          color: Colors.black87,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setPassword,
                        errorText: _accountController.passwordError,
                        label: "Senha",
                        prefixIcon: const Icon(
                          Icons.password_sharp,
                          color: Colors.black87,
                        ),
                        obscureText: _accountController.obscureText,
                        suffix: GestureDetector(
                          child: Icon(_accountController.obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onTap: () => _accountController
                              .setObscureText(!_accountController.obscureText),
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFieldCustom(
                        onChanged: _accountController.setRepeatPassword,
                        errorText: _accountController.repeatPasswordError,
                        label: "Repetir Senha",
                        prefixIcon: const Icon(
                          Icons.password_sharp,
                          color: Colors.black87,
                        ),
                        obscureText: _accountController.obscureText,
                        suffix: GestureDetector(
                          child: Icon(_accountController.obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onTap: () => _accountController
                              .setObscureText(!_accountController.obscureText),
                        ),
                      );
                    }),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    ButtonAnimated(
                      controller: _accountController,
                      width: constraints.maxWidth * 0.5,
                      name: 'Entrar',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
