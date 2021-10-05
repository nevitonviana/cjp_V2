import 'package:flutter/material.dart';

import '/components/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  const TextFieldCustom(
                    label: "E-mail",
                    prefixIcon: Icon(
                      Icons.account_box,
                      color: Colors.black87,
                    ),
                  ),
                  const TextFieldCustom(
                    label: "Senha",
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.black87,
                    ),
                    //remove_red_eye_outlined
                    suffix: Icon(Icons.remove_red_eye),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 40,
                    width: constraints.maxWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: const Border.fromBorderSide(
                        BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Cadastrar-Se",
                      style: TextStyle(color: Colors.grey),
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
//: Icons.visibility_off,
