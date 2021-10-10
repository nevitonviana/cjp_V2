import 'package:flutter/material.dart';

import '/components/widgets/widgets.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
                  const TextFieldCustom(
                    label: "Nome Completo",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                  ),
                  const TextFieldCustom(
                    label: "Bairro",
                    prefixIcon: Icon(
                      Icons.house_sharp,
                      color: Colors.black87,
                    ),
                  ),
                  const TextFieldCustom(
                    label: "Cidade",
                    prefixIcon: Icon(
                      Icons.location_city_sharp,
                      color: Colors.black87,
                    ),
                  ),
                  const TextFieldCustom(
                    label: "E-mail",
                    prefixIcon: Icon(
                      Icons.email_sharp,
                      color: Colors.black87,
                    ),
                  ),
                  const TextFieldCustom(
                    label: "Senha",
                    prefixIcon: Icon(
                      Icons.password_sharp,
                      color: Colors.black87,
                    ),
                    obscureText: true,
                    // suffix: GestureDetector(
                    //   child: Icon(
                    //       ? Icons.remove_red_eye
                    //       : Icons.visibility_off),
                    //   onTap: () {
                    //   },
                    // ),
                  ),
                  const TextFieldCustom(
                    label: "Repetir Senha",
                    prefixIcon: Icon(
                      Icons.password_sharp,
                      color: Colors.black87,
                    ),
                    obscureText: true,
                    // suffix: GestureDetector(
                    //   child: Icon(
                    //       ? Icons.remove_red_eye
                    //       : Icons.visibility_off),
                    //   onTap: () {
                    //   },
                    // ),
                  ),
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
