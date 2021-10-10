import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/widgets/widgets.dart';
import 'controller/account_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final AccountController _accountController = AccountController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            // leading: BackButton(
            //   color: Colors.grey,
            // ),
            elevation: 4,
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
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(6),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    onPressed: () {},
                    child: const Text(
                      "Cadastrar-se",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
