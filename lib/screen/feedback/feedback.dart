import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/text_field/text_field.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("FeedBack"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.1,
                        top: constraints.maxHeight * 0.1),
                    child: Text.rich(
                      TextSpan(
                        style: Fonts.fontsAlfaslabOne,
                        children: const [
                          TextSpan(text: "Caro amigos(as)\n"),
                          TextSpan(
                              text:
                                  "Obrigado por fazer parte desse teste 'BETA'\n"),
                          TextSpan(
                              text: "Use os Campos a baixor para enviar  \n"),
                          TextSpan(
                              text: "A sua opinião, critica e elogio,  \n"),
                          TextSpan(
                              text:
                                  "de grande importancia para que nos podemos evoluir,\n"),
                          TextSpan(
                              text:
                                  "De tal forma que possamos lhe atender melhor... \n"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const TextFieldCustom(
                      label: "Onde deu a falhar",
                      hintText: "EX: na tela de perfil",
                    ),
                    const TextFieldCustom(
                      label: "Descreva a Falhar",
                      hintText: "EX: a tela de perfil não abril",
                    ),
                    Divider(
                      height: constraints.maxHeight * 0.04,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text("Enviar"),
                      minWidth: constraints.maxWidth * 0.3,
                      color: Colors.blueGrey,
                      elevation: 6,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
