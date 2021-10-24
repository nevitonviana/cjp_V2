import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '/components/widgets/widgets.dart';
import '/route_generate.dart';
import 'components/widgets.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    autorun((_) {
      if (_loginController.error != null) {
        ErrorDialog().error(
          context: context,
          error: _loginController.error!,
        );
      }
      if (_loginController.emailSuccessfullySent) {
        EmailDialog().success(
            context: context,
            title: "Enviado email com sucesso",
            massage:
                "Um email de redefinição de senha,\nfoi enviado com sucesso para"
                " para o email${_loginController.email}.\n Por favor verifique"
                " a caixa de spam/lixo eletrônico");
      }
    });
    when((_) => _loginController.loginConfirmed, () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteGenerate.routeHome, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300],
                      border: const Border.fromBorderSide(
                        BorderSide(color: Colors.grey),
                      ),
                    ),
                    width: constraints.maxWidth * 0.55, //0.75
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Observer(builder: (_) {
                    return TextFieldCustom(
                      onChanged: _loginController.setEmail,
                      errorText: _loginController.errorEmail,
                      label: "E-mail",
                      prefixIcon: const Icon(
                        Icons.account_box,
                        color: Colors.black87,
                      ),
                    );
                  }),
                  Observer(
                    builder: (_) {
                      return TextFieldCustom(
                        onChanged: _loginController.setPassword,
                        errorText: _loginController.errorPassword,
                        label: "Senha",
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black87,
                        ),
                        obscureText: _loginController.visibilityPassword,
                        suffix: GestureDetector(
                          onTap: () => _loginController.setVisibilityPassword(
                              !_loginController.visibilityPassword),
                          child: Icon(
                            _loginController.visibilityPassword
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 30),
                    child: TextButton(
                      onPressed: _loginController.passwordReset,
                      child: const Text(
                        "Esqueceu a senha",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  ButtonAnimated(
                    width: constraints.maxWidth * 0.6,
                    controller: _loginController,
                    name: "Entrar",
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RouteGenerate.routeAccount),
                    child: const Text(
                      "Cadastrar-Se",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    endIndent: 70,
                    indent: 70,
                    thickness: 1,
                    height: constraints.maxHeight * 0.07,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.70,
                    child: AnimatedCard(
                      duration: const Duration(seconds: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: ButtonSocial(
                              onTap: () async {
                                await _loginController.signInGoogle();
                              },
                              image: "assets/images/google.png",
                              nome: "Google",
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 6,
                            child: ButtonSocial(
                              onTap: () async {
                                await _loginController.signInFacebook();
                              },
                              image: "assets/images/facebook.png",
                              nome: "Facebook",
                            ),
                          ),
                        ],
                      ),
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
